package gameMatching.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.tinkerpop.shaded.jackson.databind.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonSerializer;

import edu.emory.mathcs.backport.java.util.concurrent.TimeUnit;
import gameMatching.dao.GameMatchingDAO;
import gameMatching.vo.GameVO;

@Service("gameMatchingService")
public class GameMatchingServiceImpl implements GameMatchingService {
	
	@Resource(name="gameMatchingDAO")
	protected GameMatchingDAO gameMatchingDAO;
	
	@Override
	public List<GameVO> selectChampion() throws SQLException {
		return gameMatchingDAO.selectChampion();
	}
	
	@Override
	public List<GameVO> selectSummonerlist() throws SQLException {
		return gameMatchingDAO.selectSummonerlist();
	}
	
	@Override
	public List<GameVO> selectGameMatchingUserTop3() throws SQLException {
		List<String> selectGameOption = gameMatchingDAO.selectGameOption();
		int optionNumber = selectGameOption.size();
	    int tempOptionValue = 0;
	    for(int i =1; i-1<optionNumber; i++){
	        tempOptionValue = i+tempOptionValue;
	    }
	    float perOptionPlusPoint= (float)((float)100/(float)tempOptionValue);
	    System.out.println(perOptionPlusPoint);
	    List<Integer> gameOptionPointList = new ArrayList<>();
	    for(int i =1; i-1<optionNumber; i++){
	        float tempPointArrContent = perOptionPlusPoint*i;
	        gameOptionPointList.add(i-1, (int)tempPointArrContent);
	    }
        for(int i =0; i<gameOptionPointList.size(); i++){
        	System.out.println(gameOptionPointList.get(i));     
        }

		
		return gameMatchingDAO.selectSummonerlist();
	}
	

	@Override
	public void findSummonerData(List<GameVO> summonerList) throws SQLException, ParseException, FileNotFoundException, IOException, InterruptedException {
		System.out.println(summonerList.get(0).getGlSummoner());
		String summonerNameUser = "";
		ArrayList<GameVO> updateList = new ArrayList<GameVO>();
		for (int j = 0; j < summonerList.size(); j++) {
			summonerNameUser = summonerList.get(j).getGlSummoner();
			RestTemplate restTemplate = new RestTemplate();
			String apiKey = "RGAPI-8fa2fc9e-2745-4290-94fe-068f86d86ede";
			String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+summonerNameUser+"?api_key="+apiKey;
			String jsonString = restTemplate.getForObject(url, String.class);
			System.out.println(jsonString);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
			System.out.println("--------------------------data1------------------------------------------------");
			System.out.println(jsonObject);
			Object object = jsonObject.get("id");
			String lolSummonerId = String.valueOf(object);
			String url2 ="https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+lolSummonerId+"?api_key="+apiKey;
			String jsonString2 = restTemplate.getForObject(url2, String.class);
			JSONArray jsonObject2 = (JSONArray) jsonParser.parse(jsonString2);
			System.out.println("--------------------------테스트하는부분-------------------------------------------");
			System.out.println(jsonObject2.size());
			String lolTier = "unRank";
			if(jsonObject2.size() !=0) {
				JSONObject jsonResponse2 = (JSONObject) jsonObject2.get(0);
				System.out.println("--------------------------data2------------------------------------------------");
				System.out.println(jsonResponse2);
				Object objectTier = jsonResponse2.get("tier");
				lolTier = String.valueOf(objectTier);
			}
			String url3 ="https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/"+lolSummonerId+"/top?api_key="+apiKey;
			String jsonString3 = restTemplate.getForObject(url3, String.class);
			JSONArray jsonObject3 = (JSONArray) jsonParser.parse(jsonString3);
			JSONObject jsonResponseChamp1 = (JSONObject)jsonObject3.get(0);
			JSONObject jsonResponseChamp2 = (JSONObject)jsonObject3.get(1);
			JSONObject jsonResponseChamp3 = (JSONObject)jsonObject3.get(2);
			Object championId1 = jsonResponseChamp1.get("championId");
			String lolChampionId1 = String.valueOf(championId1);
			Object championId2 = jsonResponseChamp2.get("championId");
			String lolChampionId2 = String.valueOf(championId2);
			Object championId3 = jsonResponseChamp3.get("championId");
			String lolChampionId3 = String.valueOf(championId3);
			List<String> champList = new ArrayList<>();
			champList.add(lolChampionId1);
			champList.add(lolChampionId2);
			champList.add(lolChampionId3);
			System.out.println(champList);
			List<String> selectMostChampionlist = gameMatchingDAO.selectMostChampionlist(champList);
			String champName1 = selectMostChampionlist.get(0);
			String champName2 = selectMostChampionlist.get(1);
			String champName3 = selectMostChampionlist.get(2);
			String champNameTop3 = champName1+"@"+champName2+"@"+champName3;
			Object puuid = jsonObject.get("puuid");
			String lolPuuid = String.valueOf(puuid);
			String url4 ="https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+lolPuuid+"/ids?start=0&count=100&api_key="+apiKey;
			String jsonString4 = restTemplate.getForObject(url4, String.class);
			JSONArray jsonObject4 = (JSONArray) jsonParser.parse(jsonString4);
			System.out.println("--------------------------data4------------------------------------------------");
			System.out.println(jsonObject4.size());
			Object objectTemp = new Object();
			String matchIdTemp = "";
			ArrayList<String> arrayList = new ArrayList<>();
			String urlPositionTempUrl = "";
			JSONObject urlPositionTempObject = new JSONObject();
			String lineNameTemp = "";
			int top =0;
			int junggle = 0;
			int carry = 0;
			int mid = 0;
			int support = 0;
			
			for (int i = 0; i < jsonObject4.size(); i++) {
				objectTemp = jsonObject4.get(i);
				matchIdTemp = String.valueOf(objectTemp);
				System.out.println(matchIdTemp);
				urlPositionTempUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/"+matchIdTemp+"?api_key="+apiKey;
				try {
					urlPositionTempObject = restTemplate.getForObject(urlPositionTempUrl, JSONObject.class);
					Map<String, List<Map<String,String>>> urlPositionTempObject2 = (Map<String, List<Map<String,String>>>) urlPositionTempObject.get("info");
					List<Map<String,String>> listTemp = urlPositionTempObject2.get("participants");
					for (int t = 0; t < listTemp.size(); t++) {
						if(t%30 ==0) {
							Thread.sleep(1000);
						}
						if(listTemp.get(t).get("summonerName").equals(summonerNameUser)){
							
							System.out.println(t);
							System.out.println(listTemp.get(t));
							if(listTemp.get(t).get("teamPosition") !=null) {
								lineNameTemp = listTemp.get(t).get("teamPosition");
							}
							if(lineNameTemp.equals("BOTTOM")) {
								lineNameTemp = listTemp.get(t).get("role");
							}
							if(lineNameTemp.equals("TOP")) {
								top = 1+top;
							}else if(lineNameTemp.equals("JUNGLE")) {
								junggle = 1+junggle;
							}else if(lineNameTemp.equals("MIDDLE")) {
								mid = 1+mid;
							}else if(lineNameTemp.equals("CARRY")) {
								carry = 1+carry;
							}else if(lineNameTemp.equals("UTILITY")) {
								support = 1+support;
							}else if(lineNameTemp.equals("SUPPORT")) {
								support = 1+support;
							}
							System.out.println(lineNameTemp);
						}	
					}
				} catch (Exception e) {
					// TODO: handle exception
				}			
			}
			System.out.println(top);
			System.out.println(junggle);
			System.out.println(mid);
			System.out.println(carry);
			System.out.println(support);
			ArrayList<Integer> arrayListPositionNumber = new ArrayList<>();
			arrayListPositionNumber.add(top);
			arrayListPositionNumber.add(junggle);
			arrayListPositionNumber.add(mid);
			arrayListPositionNumber.add(carry);
			arrayListPositionNumber.add(support);
			int max =arrayListPositionNumber.get(0);
			int maxIndex =0;
			for(int a=0;a<arrayListPositionNumber.size();a++) {
			    if(max<arrayListPositionNumber.get(a)) {
					//max의 값보다 array[i]이 크면 max = array[i]
					max = arrayListPositionNumber.get(a);
					maxIndex = a;
			    }
			}
			if(maxIndex == 0) {
				if(max ==0) {
					lineNameTemp = "측정불가";
				}else {
					lineNameTemp = "TOP";
				}
			}else if(maxIndex == 1) {
				lineNameTemp = "JUNGGLE";
			}else if(maxIndex == 2) {
				lineNameTemp = "MIDDLE";
			}else if(maxIndex == 3) {
				lineNameTemp = "CARRY";
			}else if(maxIndex == 4) {
				lineNameTemp = "SUPPORT";
			}
			System.out.println("-----------------------Find-----------------------");
			System.out.println("랭크 티어");
			System.out.println(lolTier);
			System.out.println("챔프 top3");
			System.out.println(champNameTop3);
			System.out.println("라인명");
			System.out.println(lineNameTemp);
			summonerList.get(j).setGlChampion(champNameTop3);
			summonerList.get(j).setGlPosition(lineNameTemp);
			summonerList.get(j).setGlRank(lolTier);
			updateList.add(summonerList.get(j));
		}
		gameMatchingDAO.updateUserGameInfo(updateList);
		
		
	}

}
