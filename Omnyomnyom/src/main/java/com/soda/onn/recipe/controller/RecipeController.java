package com.soda.onn.recipe.controller;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver.Builder;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.recipe.model.service.RecipeService;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/recipe-details")
	public void recipedetails() {
		
	}
	@GetMapping("/recipeUpload")
	public void recipeUpload() {
		
	}
	
	@PostMapping("/recipeUpload")
	public void recipeUpload(Recipe recipe,
							 @RequestParam(value = "chefId") String chefId,
							 @RequestParam(value = "chefNick") String chefNick,
							 @RequestParam(value = "uploadFile") MultipartFile uploadFile,
							 @RequestParam(value = "ingr_name") String[] ingrName,
							 @RequestParam(value = "ingr_mass") String[] ingrMass,
							 @RequestParam(value = "tn_firstname") int[] cookTime,
							 @RequestParam(value = "tn_lastname") String[] cookery,
							 @RequestParam(value = "ingr_number") int[] ingNo) {
		
//		log.debug("{}",chef);
//		recipe.setChefId(chef.getMemberId());
//		recipe.setChefNick(chef.getMemberNick());
		recipe.setChefId(chefId);
		recipe.setChefNick(chefNick);
		
		log.debug("{}",recipe);
		
		if (!uploadFile.isEmpty()) {
			log.debug("{}",uploadFile.getOriginalFilename());
			
			YouTube youtubeService = null;
			try {
				youtubeService = getService();
			} catch (GeneralSecurityException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			// Define the Video object, which will be uploaded as the request body.
			Video video = new Video();

			VideoStatus status = new VideoStatus();

			status.setPrivacyStatus("unlisted");

			video.setStatus(status);

			VideoSnippet snippet = new VideoSnippet();

			snippet.setTitle(recipe.getRecipeName());
			snippet.setDescription(recipe.getRecipeContent());

//        List<String> tags = new ArrayList<String>();
//        tags.add("이게");
//        tags.add("되면");
//        tags.add("좋겠다.");
//        snippet.setTags(tags);

			video.setSnippet(snippet);

			// TODO: For this request to work, you must replace "YOUR_FILE"
			// with a pointer to the actual file you are uploading.
			// The maximum file size for this operation is 128GB.
			// File mediaFile = new
			// File(httpRequest.getServletContext().getRealPath("resources"),"KakaoTalk_Video_20190719_1734_13_287.mp4");
			InputStreamContent mediaContent;
			try {
				mediaContent = new InputStreamContent("video/*", new BufferedInputStream(uploadFile.getInputStream()));
				mediaContent.setLength(uploadFile.getSize());

				// Define and execute the API request
				YouTube.Videos.Insert request = youtubeService.videos().insert("snippet,statistics,status", video,
						mediaContent);

				Video response = request.execute();
				log.debug("youtubeId={}",response.getId());
				recipe.setRecipeId(response.getId());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		List<RecipeIngredient> ingredientList = new ArrayList<RecipeIngredient>();
		
		for(int i =0;i<ingrName.length ;i++) {
			RecipeIngredient ingr = new RecipeIngredient(ingNo[i], ingrMass[i], ingrName[i], 0);
			ingredientList.add(ingr);
		}
		log.debug(ingredientList.toString());
		
		List<Map<String,String>> list = (List<Map<String,String>>)new Gson().fromJson(recipe.getCategory(), new TypeToken<List<Map<String,String>>>(){}.getType());
		
		if(!list.isEmpty()) {
			log.debug(list.get(0).get("value"));
			recipe.setCategory(list.get(0).get("value"));
		}
		
		recipe.setTimeline("");
		for(int i =0;i < cookTime.length ;i++) {
			
			if(i>0)
				recipe.setTimeline(recipe.getTimeline()+"/");
			
			recipe.setCookingTime(recipe.getCookingTime()+cookTime[i]);
			recipe.setTimeline(recipe.getTimeline() + cookTime[i]+":"+cookery[i]);
		}
		
		log.debug("{}",recipe);
		
		int result = recipeService.recipeUpload(recipe,ingredientList);
		
		log.debug("insert Result={}", result>0?true:false);
	}
	
	@GetMapping("/recipeUpdate")
	public void recipeUpdate() {
		
	}
	
	@GetMapping("/recipe-menu-search")
	public void recipemenusearch() {
		
	}
	
	@GetMapping("/ingredientsSelection")
	public String selectedIngredientsList() {
		return "recipe/ingredientsSelection";
	}
	
	@GetMapping(value = "/{ingredient}/ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String ingredientAjax(@PathVariable("ingredient") String ingr) {
		log.debug(ingr);
		if(ingr == null || ingr.equals("")) {
			return "[]";
		}
		
		List<Ingredient> list = recipeService.ingredientAjax(ingr); 
		
		JsonArray jArray = new JsonArray();
		for(Ingredient i : list) {
			JsonObject jObj = new JsonObject();
			jObj.addProperty("ingredientName", i.getIngredientName());
			jObj.addProperty("ingredientNo", i.getIngredientNo());
			jArray.add(jObj);
		}
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		log.debug("{}",list);
		log.debug(gson.toJson(jArray));
		return gson.toJson(jArray);
	}
	
	
	
	/*
	 * Copyright 2020 the original author or authors.
	 *
	 * Licensed under the Apache License, Version 2.0 (the "License");
	 * you may not use this file except in compliance with the License.
	 * You may obtain a copy of the License at
	 *
	 *      https://www.apache.org/licenses/LICENSE-2.0
	 *
	 * Unless required by applicable law or agreed to in writing, software
	 * distributed under the License is distributed on an "AS IS" BASIS,
	 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 * See the License for the specific language governing permissions and
	 * limitations under the License.
	 */
	private static final String CLIENT_SECRETS= "/client_secret.json";
    private static final Collection<String> SCOPES =
        Arrays.asList("https://www.googleapis.com/auth/youtube.upload");
    	

    private static final String APPLICATION_NAME = "레시피 등록";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    /**
     * Create an authorized Credential object.
     *
     * @return an authorized Credential object.
     * @throws IOException
     */
    public static Credential authorize(final NetHttpTransport httpTransport) throws IOException {
        // Load client secrets.
    	
        InputStream in = RecipeController.class.getResourceAsStream(CLIENT_SECRETS);
        GoogleClientSecrets clientSecrets =
          GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
        
        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow =
            new GoogleAuthorizationCodeFlow.Builder(httpTransport, JSON_FACTORY, clientSecrets, SCOPES).build();
        
        Builder localBuilder =  new LocalServerReceiver.Builder().setHost("localhost").setPort(20202);

        LocalServerReceiver local = localBuilder.build();

        AuthorizationCodeInstalledApp authoApp = new AuthorizationCodeInstalledApp(flow, local);

        //여기서 걸린다!
        Credential credential = authoApp.authorize("user");

        return credential;
    }

    /**
     * Build and return an authorized API client service.
     *
     * @return an authorized API client service
     * @throws GeneralSecurityException, IOException
     */
    public static YouTube getService() throws GeneralSecurityException, IOException {
    	
        final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
        Credential credential = authorize(httpTransport);
        
        return new YouTube.Builder(httpTransport, JSON_FACTORY, credential)
            .setApplicationName(APPLICATION_NAME)
            .build();
    }
	
}
