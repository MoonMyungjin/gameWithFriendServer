package gameMatching.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
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

import com.datastax.oss.driver.shaded.guava.common.collect.Comparators;
import com.fasterxml.jackson.databind.JsonSerializer;

import base.matching.dao.MatchingDAO;
import base.matching.vo.MatchingHistoryVO;
import base.report.dao.FReportDAO;
import edu.emory.mathcs.backport.java.util.concurrent.TimeUnit;
import gameMatching.dao.GameMatchingDAO;
import gameMatching.vo.GameVO;
import util.CustomMap;

@Service("gameMatchingService")
public class GameMatchingServiceImpl<E> implements GameMatchingService {
	
	@Resource(name="gameMatchingDAO")
	protected GameMatchingDAO gameMatchingDAO;
	
	@Resource(name="MatchingDAO")
	protected MatchingDAO matchingDAO;
	
	@Resource(name="FReportDAO")
	protected FReportDAO fReportDAO;
	
	@Override
	public List<GameVO> selectChampion() throws SQLException {
		return gameMatchingDAO.selectChampion();
	}
	
	@Override
	public List<GameVO> selectSearchChampion(String keyWord) throws SQLException {
		return gameMatchingDAO.selectSearchChampion(keyWord);
	}
	
	@Override
	public List<GameVO> selectSummonerlist() throws SQLException {
		return gameMatchingDAO.selectSummonerlist();
	}
	
	@Override
	public List<GameVO> selectGameMatchingUserTop3(HashMap<String, Object> optionInfo, String myId) throws SQLException {
		/* 100점 기준 옵션 갯수에 따른 옵션마다 차등 점수 배분 시작 */
		
		List<String> selectGameOption = gameMatchingDAO.selectGameOption();
		
		List<String> userSelectOptionList = new ArrayList<>();
		List<String> userSelectOptionDetailList = new ArrayList<>();
		int userSelectOptionSize = optionInfo.size();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(optionInfo);
		for(int i=0; i<userSelectOptionSize; i++) {
			Object object = optionInfo.get(""+i);
			System.out.println(object.toString());
			if((i+1)%2 == 0) {
				String option = optionInfo.get(""+(i-1)).toString();
				userSelectOptionList.add(option);
				String optionDetail = optionInfo.get(""+(i)).toString();
				userSelectOptionDetailList.add(optionDetail);	
			}
			
		}
        
		int optionNumber = userSelectOptionList.size();
	    int tempOptionValue = 0;
	    for(int i =1; i-1<optionNumber; i++){
	        tempOptionValue = i+tempOptionValue;
	    }
	    float perOptionPlusPoint= (float)((float)100/(float)tempOptionValue);
	    List<Integer> gameOptionPointList = new ArrayList<>();
	    for(int i =1; i-1<optionNumber; i++){
	        float tempPointArrContent = perOptionPlusPoint*i;
	        gameOptionPointList.add(i-1, (int)tempPointArrContent);
	    }
        gameOptionPointList.sort(Comparator.reverseOrder());
        System.out.println(gameOptionPointList);
        /* 100점 기준 옵션 갯수에 따른 옵션마다 차등 점수 배분 끝*/
        
        /* 각 옵션에 따른 매칭 포인트 부여 부분*/
        
        List<GameVO> selectUserList = gameMatchingDAO.selectUserlist();
	 	MatchingHistoryVO vo = new MatchingHistoryVO();
	 	vo.setmMyID(myId);
	 	List<MatchingHistoryVO> selectExceptList = matchingDAO.selectExceptList(vo);

	 	if(selectExceptList.size()>0) {
	 		for (int i = 0; i < selectExceptList.size(); i++) {
				
	 			for (int j = 0; j < selectUserList.size(); j++) {
	 				if(selectExceptList.get(i).getmUserID().equals(selectUserList.get(j).getGlNick())) {
	 					selectUserList.remove(j);
	 				}
	 				
				}
	 			
			}
	 	}
	 	List<CustomMap> selectReportTargetIdList = fReportDAO.selectReportTargetIdList(myId);
	 	if(selectReportTargetIdList.size()>0) {
	 		for (int i = 0; i < selectReportTargetIdList.size(); i++) {
				
	 			for (int j = 0; j < selectUserList.size(); j++) {
	 				if(selectReportTargetIdList.get(i).get("reTargetId").equals(selectUserList.get(j).getGlNick())) {
	 					selectUserList.remove(j);
	 				}
	 				
				}
	 			
			}
	 	}
	 	
        for(int i=0; i<userSelectOptionList.size(); i++) {
        	if(userSelectOptionList.get(i).equals("rank")) {
	    		int optionSelectNumber =i;
	    	    int optionSelectNumberPoint =gameOptionPointList.get(optionSelectNumber);
	    	    String choice  = userSelectOptionDetailList.get(i);
	    	    selectUserList = optionRankPointGet(optionSelectNumber,optionSelectNumberPoint,selectUserList,choice);
        	}else if(userSelectOptionList.get(i).equals("position")) {
        		int optionSelectNumber =i;
       	     	int optionSelectNumberPoint =gameOptionPointList.get(optionSelectNumber);
       	     	String choice  = userSelectOptionDetailList.get(i);
       	     	selectUserList = optionPositionPointGet(optionSelectNumber, optionSelectNumberPoint, selectUserList, choice);
        	}else if(userSelectOptionList.get(i).equals("champion")) {
        		int optionSelectNumber =i;
       	     	int optionSelectNumberPoint =gameOptionPointList.get(optionSelectNumber);
       	     	String choice  = userSelectOptionDetailList.get(i);
       	     	selectUserList = optionChampionPointGet(optionSelectNumber, optionSelectNumberPoint, selectUserList, choice);
        	}else if(userSelectOptionList.get(i).equals("time")) {
        		int optionSelectNumber =i;
       	     	int optionSelectNumberPoint =gameOptionPointList.get(optionSelectNumber);
       	     	String choice  = userSelectOptionDetailList.get(i);
       	     	selectUserList = optionTimePointGet(optionSelectNumber, optionSelectNumberPoint, selectUserList, choice);
        	}
        	
        	
        }
        List<GameVO> top3UserList = new ArrayList<>();
        float top1 =0;
        int top1Index = 0;
        float top2 =0;
        int top2Index = 0;
        float top3 =0;
        int top3Index = 0;
        for(int i=0; i<selectUserList.size(); i++) {
        	float postionScore = selectUserList.get(i).getPostionScore();
        	float championScore = selectUserList.get(i).getChampionScore();
        	float timeScore = selectUserList.get(i).getTimeScore();
        	float rankScore = selectUserList.get(i).getRankScore();
        	float matchingScore = postionScore + championScore + timeScore + rankScore;
        	selectUserList.get(i).setMatchingScore(matchingScore);
        	System.out.println(selectUserList.get(i).getGlSummoner());
        	System.out.println("포지션"+postionScore);
        	System.out.println("랭크"+rankScore);
        	System.out.println("시간"+timeScore);
        	System.out.println("챔프"+championScore);
        	System.out.println("종합"+matchingScore);
        	
        	if(top1<matchingScore) {
        		top1 = matchingScore;
        		top1Index = i;
        	}else if(top2<matchingScore) {
        		top2 = matchingScore;
        		top2Index = i;
        	}else if(top3<matchingScore) {
        		top3 = matchingScore;
        		top3Index = i;
        	}
        }
        
        
        top3UserList.add(selectUserList.get(top1Index));
        top3UserList.add(selectUserList.get(top2Index));
        top3UserList.add(selectUserList.get(top3Index));
        
        for (int i = 0; i < top3UserList.size(); i++) {
        	 top3UserList.get(i).setMyId(myId);
        	 top3UserList.get(i).setGameType("랭크");
        	 String selectMatchingHistoryTableKey = matchingDAO.selectMatchingHistoryTableKey();
        	 top3UserList.get(i).setChIndex(selectMatchingHistoryTableKey);
		}
        
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println(top3UserList.get(0).getMatchingScore());      
        System.out.println(top3UserList.get(0).getGlNick());
        System.out.println(top3UserList.get(0).getGlRank());        	
        System.out.println(myId);
        
        matchingDAO.insertMatchingHistory(top3UserList);
		return top3UserList;
	}
	

	@Override
	public void findSummonerData(List<GameVO> summonerList) throws SQLException, ParseException, FileNotFoundException, IOException, InterruptedException {
		
		System.out.println(summonerList.get(0).getGlSummoner());
		String summonerNameUser = "";
		JSONParser jsonParser = new JSONParser();
		RestTemplate restTemplate = new RestTemplate();
		ArrayList<GameVO> updateList = new ArrayList<GameVO>();
		String apiKey = "RGAPI-522c7f1f-69df-4f3b-b673-e1f1d02af1fb";
		for (int j = 0; j < summonerList.size(); j++) {/* 인증한 유저리스트만큼 돌리기*/
			summonerNameUser = summonerList.get(j).getGlSummoner();
			
			/* --------------------------서머너 아이디 얻기 시작--------------------------*/
			String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+summonerNameUser+"?api_key="+apiKey;
			String jsonString = restTemplate.getForObject(url, String.class);
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
			Object object = jsonObject.get("id");
			String lolSummonerId = String.valueOf(object);
			/* --------------------------서머너 아이디 얻기 끝--------------------------*/
			
			/* --------------------------티어 얻기 시작--------------------------*/
			String url2 ="https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+lolSummonerId+"?api_key="+apiKey;
			String jsonString2 = restTemplate.getForObject(url2, String.class);
			JSONArray jsonObject2 = (JSONArray) jsonParser.parse(jsonString2);
			String lolTier = "UNRANK";
			String lolRank = "";
			if(jsonObject2.size() !=0) {
				JSONObject jsonResponse2 = (JSONObject) jsonObject2.get(0);
				Object objectTier = jsonResponse2.get("tier");
				Object objectRank= jsonResponse2.get("rank");
				lolTier = String.valueOf(objectTier);
				lolRank = String.valueOf(objectRank);
				if(lolRank.equals("I")) {
					lolRank = "1";
				}else if(lolRank.equals("II")) {
					lolRank = "2";
				}else if(lolRank.equals("III")) {
					lolRank = "3";
				}else if(lolRank.equals("IV")) {
					lolRank = "4";
				}
			}
			/* --------------------------티어 얻기 끝--------------------------*/
			
			/* --------------------------챔피언 Top3  얻기 시작--------------------------*/
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
			List<String> selectMostChampionlist = gameMatchingDAO.selectMostChampionlist(champList);
			String champName1 = selectMostChampionlist.get(0);
			String champName2 = selectMostChampionlist.get(1);
			String champName3 = selectMostChampionlist.get(2);
			String champNameTop3 = champName1+"@"+champName2+"@"+champName3;
			/* --------------------------챔피언 Top3  얻기 끝 --------------------------*/
			
			/* --------------------------포지션 분류하기  시작 --------------------------*/
			Object puuid = jsonObject.get("puuid");
			String lolPuuid = String.valueOf(puuid);
			String url4 ="https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+lolPuuid+"/ids?start=0&count=10&api_key="+apiKey;
			String jsonString4 = restTemplate.getForObject(url4, String.class);
			JSONArray jsonObject4 = (JSONArray) jsonParser.parse(jsonString4);
			Object objectTemp = new Object();
			String matchIdTemp = "";
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
			/* --------------------------포지션 분류하기 끝 --------------------------*/
			
			System.out.println("-----------------------Find-----------------------");
			System.out.println("랭크 티어");
			System.out.println(lolTier);
			System.out.println(lolRank);
			System.out.println("챔프 top3");
			System.out.println(champNameTop3);
			System.out.println("라인명");
			System.out.println(lineNameTemp);
			summonerList.get(j).setGlChampion(champNameTop3);
			summonerList.get(j).setGlPosition(lineNameTemp);
			summonerList.get(j).setGlRank(lolTier+lolRank);
			updateList.add(summonerList.get(j));
		}
		gameMatchingDAO.updateUserGameInfo(updateList);
		
		
	}

	@Override
	public List<GameVO> optionRankPointGet(int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList,String iRankChoice) throws SQLException {
	 	List<String> selectRankList = gameMatchingDAO.selectRankList();
	 	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
	 	System.out.println(optionSelectNumber);
	 	System.out.println(optionSelectNumberPoint);
	 	System.out.println(selectUserList);
	 	System.out.println(iRankChoice);
	 	System.out.println("@@@@@@@@@@@@splitTest@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
	 	String[] split = iRankChoice.split("~");
	 	System.out.println(split[0]);
	 	System.out.println(split[1]);
	 	String substring ="0";
	 	String substring2 ="0";
	 	if(split[0].equals("UNRANK")) {
	 		
	 	}else if(split[0].equals("MASTER")) {
	 		
	 	}else if(split[0].equals("GRANDMASTER")) {
	 		
	 	}else if(split[0].equals("CHALLENGER")) {
	 		
	 	}else {
	 		substring = split[0].substring(split[0].length()-1, split[0].length());
	 	}
	 	
	 	if(split[1].equals("UNRANK")) {
	 		
	 	}else if(split[1].equals("MASTER")) {
	 		
	 	}else if(split[1].equals("GRANDMASTER")) {
	 		
	 	}else if(split[1].equals("CHALLENGER")) {
	 		
	 	}else {
	 		substring2 = split[1].substring(split[1].length()-1, split[1].length());
	 	}	
	 	
	 	System.out.println(substring);
	 	System.out.println(substring2);
	 	String substringRank = "";
	 	String substringRank2 = "";
	 	if(substring.equals("0")) {
	 		substringRank= split[0].substring(0, split[0].length());
	 	}else {
	 		substringRank= split[0].substring(0, split[0].length()-1);
	 	}
	 	if(substring2.equals("0")) {
	 		substringRank2 = split[1].substring(0, split[1].length());
	 	}else {
	 		substringRank2 = split[1].substring(0, split[1].length()-1);
	 	}
	 	
	 	
	 	float bounsIndex = (Integer.parseInt(substring)-Integer.parseInt(substring2));
	 	if(Integer.parseInt(substring)-Integer.parseInt(substring2)<0) {
	 		bounsIndex = bounsIndex*-1;
	 	}
	 	System.out.println(bounsIndex);
	 	System.out.println(substringRank);
	 	System.out.println(substringRank2);
	 	int firstIndex = 0;
	 	int secondIndex = 0;
	 	List<String> tempSelectRankList = selectRankList;
	 	for(int j=0; j<tempSelectRankList.size(); j++) {
	 		if(tempSelectRankList.get(j).equals(substringRank)) {
	 			firstIndex = j;
	 		}
	 	}
	 	List<String> subList = tempSelectRankList.subList(firstIndex, tempSelectRankList.size());
	 	for(int j=0; j<subList.size(); j++) {
	 		if(subList.get(j).equals(substringRank2)) {
	 			secondIndex = j;
	 		}
	 	}
	 	List<String> tempPeriodList = subList.subList(0, secondIndex+1);
	 	List<String> periodList = new ArrayList<>();
	 	
	 	System.out.println(tempPeriodList);
	 	System.out.println(periodList);
	 	int tempIndex =0;
	 	for(int j=0; j<tempPeriodList.size(); j++) {
	 		
	 		if(tempPeriodList.get(j).equals("UNRANK")) {
	 			periodList.add(tempIndex, tempPeriodList.get(j));
	 		}else if(tempPeriodList.get(j).equals("MASTER")) {
	 			periodList.add(tempIndex, tempPeriodList.get(j));
	 		}else if(tempPeriodList.get(j).equals("GRANDMASTER")) {
	 			periodList.add(tempIndex, tempPeriodList.get(j));
	 		}else if(tempPeriodList.get(j).equals("CHALLENGER")) {
	 			periodList.add(tempIndex, tempPeriodList.get(j));
	 		}else {
	 			if(j == tempPeriodList.size()-1) {

	 				System.out.println(j);
	 				int forTempIndex = Integer.parseInt(substring2);
	 				for(int a =forTempIndex; a>0; a-- ) {
	 					if(j == 0) {
	 						periodList.add(tempIndex, tempPeriodList.get(j)+a);
	 					}else {
	 						periodList.add(tempIndex+1, tempPeriodList.get(j)+a);
	 					}
	 					
	 				}
	 				
	 			}else {
	 				
	 				if(j == 0) {
		 				periodList.add(tempIndex,tempPeriodList.get(j)+"4");
			 			periodList.add(tempIndex, tempPeriodList.get(j)+"3");
			 			periodList.add(tempIndex, tempPeriodList.get(j)+"2");
			 			periodList.add(tempIndex, tempPeriodList.get(j)+"1");
			 			tempIndex = tempIndex+4;
	 				}else {
		 				periodList.add(tempIndex+1, tempPeriodList.get(j)+"4");
			 			periodList.add(tempIndex+1, tempPeriodList.get(j)+"3");
			 			periodList.add(tempIndex+1, tempPeriodList.get(j)+"2");
			 			periodList.add(tempIndex+1, tempPeriodList.get(j)+"1");
			 			tempIndex = tempIndex+4;
	 				}
	 			}
	 			
	 		}
	 		tempIndex = tempIndex++;
	 	}
	 	System.out.println(periodList);
        for(int j=0; j<selectUserList.size(); j++) {
        	float totalPoint =0;
        	int userUnderRankNumber = 0;
        	int userIChoiceRangeIndex = 0;
        	for(int p=0; p<periodList.size(); p++) {
        		String userRank ="";
        		if(selectUserList.get(j).getGlRank().equals("UNRANK")) {
        			userRank = selectUserList.get(j).getGlRank();
    	 		}else if(selectUserList.get(j).getGlRank().equals("MASTER")) {
    	 			userRank = selectUserList.get(j).getGlRank();
    	 		}else if(selectUserList.get(j).getGlRank().equals("GRANDMASTER")) {
    	 			userRank = selectUserList.get(j).getGlRank();
    	 		}else if(selectUserList.get(j).getGlRank().equals("CHALLENGER")) {
    	 			userRank = selectUserList.get(j).getGlRank();
    	 		}else {
    	 			userRank = selectUserList.get(j).getGlRank().substring(0, selectUserList.get(j).getGlRank().length()-1);
    	 			userUnderRankNumber =   Integer.parseInt(selectUserList.get(j).getGlRank().substring(selectUserList.get(j).getGlRank().length()-1,selectUserList.get(j).getGlRank().length() ));
    	 		}
                int indexGap =0;
                int iChoiceIndex=0;
                int userChoiceIndex=0;
                int iChoiceUnderRankNumber = 0;
                for(int i =0; i<selectRankList.size(); i++){
                	String iChoiceRank = "";
                	if(periodList.get(p).equals("UNRANK")) {
                		iChoiceRank = periodList.get(p);
        	 		}else if(periodList.get(p).equals("MASTER")) {
        	 			iChoiceRank = periodList.get(p);
        	 		}else if(periodList.get(p).equals("GRANDMASTER")) {
        	 			iChoiceRank = periodList.get(p);
        	 		}else if(periodList.get(p).equals("CHALLENGER")) {
        	 			iChoiceRank = periodList.get(p);
        	 		}else {
        	 			iChoiceRank = periodList.get(p).substring(0, periodList.get(p).length()-1);
        	 			iChoiceUnderRankNumber =  Integer.parseInt(periodList.get(p).substring(periodList.get(p).length()-1, periodList.get(p).length()));
        	 			
        	 		}
                	if(selectRankList.get(i).equals(iChoiceRank)) {
                		iChoiceIndex=i;
                	}
                	if(selectRankList.get(i).equals(userRank)) {
                		userChoiceIndex=i;
                	}
                	
            		if(userUnderRankNumber > iChoiceUnderRankNumber ) {

                		userIChoiceRangeIndex = userUnderRankNumber - iChoiceUnderRankNumber;
                	}else {

                		userIChoiceRangeIndex = iChoiceUnderRankNumber - userUnderRankNumber;
                	}
            		userIChoiceRangeIndex = 4-userIChoiceRangeIndex;
                	
                }
                if(userChoiceIndex>iChoiceIndex) {
                	indexGap =userChoiceIndex-iChoiceIndex;
            	}else if(userChoiceIndex<iChoiceIndex) {
            		indexGap =iChoiceIndex-userChoiceIndex;
            	}
               
               
                float optionPoint =((float)optionSelectNumberPoint/(float)selectRankList.size());
                float userPoint =(float)optionSelectNumberPoint-((float)indexGap*(float)optionPoint);
                float tempUnderPoint = optionPoint/4;
                float detailBounusPoint = 0;
                detailBounusPoint = tempUnderPoint * (float)userIChoiceRangeIndex;
                userPoint = userPoint - detailBounusPoint;
                totalPoint =totalPoint + userPoint;

        	}
        	totalPoint = totalPoint/periodList.size();
            selectUserList.get(j).setRankScore(totalPoint);
        }
	 	System.out.println(selectUserList);
        
		return selectUserList;
	}

	
	@Override
	public List<GameVO> optionPositionPointGet(int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iPositionChoice) throws SQLException {
		
		
		for(int j=0; j<selectUserList.size(); j++) {
			String userRank =selectUserList.get(j).getGlPosition();
			if(userRank.equals(iPositionChoice)) {
				selectUserList.get(j).setPostionScore(optionSelectNumberPoint);
			}else {
				selectUserList.get(j).setPostionScore(0);
			}
		}
		return selectUserList;
	}
	
	@Override
	public List<GameVO> optionTimePointGet(int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iTimeChoice) throws SQLException {
		for(int j=0; j<selectUserList.size(); j++) {
			String userTime =selectUserList.get(j).getGlTime();
			if(userTime.equals(iTimeChoice)) {
				selectUserList.get(j).setTimeScore(optionSelectNumberPoint);
			}else {
				selectUserList.get(j).setTimeScore(0);
			}
		}
		return selectUserList;
	}
	@Override
	public List<GameVO> optionChampionPointGet(int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iChampionChoice) throws SQLException {
		for(int j=0; j<selectUserList.size(); j++) {
			String userCmapion =selectUserList.get(j).getGlChampion();
			String[] split = userCmapion.split("@");
			float ChampionScore =0;
			for(int i=0; i<split.length; i++) {
				if(split[i].equals(iChampionChoice)) {	
					ChampionScore = (float) optionSelectNumberPoint-(((float)optionSelectNumberPoint/(float)split.length)*(float)(i)); 
				}
			}
			selectUserList.get(j).setChampionScore(ChampionScore);
		}
		return selectUserList;
	}

}
