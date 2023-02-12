package com.lms.hexa.service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.ClassDAO;
import com.lms.hexa.dao.LessonDAO;
import com.lms.hexa.dao.ManagerAttandanceDAO;
import com.lms.hexa.dao.NoticeDAO;
import com.lms.hexa.dao.ParentDAO;
import com.lms.hexa.dao.ScoreDAO;
import com.lms.hexa.dao.StudentDAO;
import com.lms.hexa.dao.TimetableDAO;
import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.SchoolVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.TimeTableVO;

public class ParentServiceImpl implements ParentService{
	
	private ParentDAO parentDAO;
	
	public void setParentDAO(ParentDAO parentDAO) {
		this.parentDAO = parentDAO;
	}
	
	private LessonDAO lessonDAO;
	
	public void setLessonDAO(LessonDAO lessonDAO) {
		this.lessonDAO = lessonDAO;
	}
	private ClassDAO classDAO;
	
	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}
	private TimetableDAO timetableDAO;
	
	public void setTimetableDAO(TimetableDAO timetableDAO) {
		this.timetableDAO = timetableDAO;
	}
	private ScoreDAO scoreDAO;
	
	public void setScoreDAO(ScoreDAO scoreDAO) {
		this.scoreDAO = scoreDAO;
	}
	private NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	private StudentDAO studentDAO;
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	private ManagerAttandanceDAO managerAttandanceDAO;
	
	public void setManagerAttandanceDAO(ManagerAttandanceDAO managerAttandanceDAO) {
		this.managerAttandanceDAO = managerAttandanceDAO;
	}

	@Override
	public void updatePwd(String emailAddress) throws Exception {
		parentDAO.updatePwd(emailAddress);
		
	}

	@Override
	public ParentVO getParent(String id) throws SQLException {
		ParentVO parent = parentDAO.selectParentById(id);
		
		return parent;
	}

	@Override
	public void modifyPwd(ParentVO parent) throws SQLException {
		parentDAO.modifyPwd(parent);
	}

	@Override
	public void insertParent(ParentVO parent) throws SQLException {
		parentDAO.insertParent(parent);
	}

	@Override
	public ParentVO selectParentByStudentId(String id) throws SQLException {
		ParentVO parent = parentDAO.selectParentByStudentId(id);
		return parent;
	}

	@Override
	public Map<String, Object> selectParentList(Criteria cri) throws SQLException {
		cri.setPerPageNum(300);
		List<ParentVO> parentList = parentDAO.selectParentList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(parentDAO.selectParentListTotalCount(cri));
		
		Map<String, Object> dataMap = new Hashtable<String, Object>();
		dataMap.put("parentList", parentList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getMain(DayInfo dayInfo, String parentId,String StudentId) throws Exception {
		
			List<StudentVO> selectChildList = studentDAO.selectChildList(parentId);
			StudentVO studentVO = selectChildList.get(0);
			String id = studentVO.getId();
			
			if(StudentId !=null) {
				id = StudentId;
			}
		
			/////////////////////////////나의 시간표///////////////////////////////////////////
					
			if(dayInfo.getMonday() == null) {
			String[] weekCalendar = dayInfo.weekCalendar("");
			dayInfo.setMonday(weekCalendar[0]);
			dayInfo.setTuesday(weekCalendar[1]);
			dayInfo.setWednesday(weekCalendar[2]);
			dayInfo.setThursday(weekCalendar[3]);
			dayInfo.setFriday(weekCalendar[4]);
			dayInfo.setSaturday(weekCalendar[5]);
			
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			int dayOfYear = now.getDayOfYear();
			int week2 = (int) Math.ceil((dayOfYear-3)/7+1);
			String week = year+"-W"+week2;
			dayInfo.setWeek(week);
			}
			
			Map<String, Object> byDayMap = new HashMap<String, Object>();
			List<LessonVO> mondayList = lessonDAO.selectdayUserList(dayInfo.getMonday(),id);
			List<LessonVO> tuesdayList = lessonDAO.selectdayUserList(dayInfo.getTuesday(),id);
			List<LessonVO> wednesdayList = lessonDAO.selectdayUserList(dayInfo.getWednesday(),id);
			List<LessonVO> thursdayList = lessonDAO.selectdayUserList(dayInfo.getThursday(),id);
			List<LessonVO> fridayList = lessonDAO.selectdayUserList(dayInfo.getFriday(),id);
			List<LessonVO> saturdayList = lessonDAO.selectdayUserList(dayInfo.getSaturday(),id);
			
			byDayMap.put("mondayList", mondayList);
			byDayMap.put("tuesdayList", tuesdayList);
			byDayMap.put("wednesdayList", wednesdayList);
			byDayMap.put("thursdayList", thursdayList);
			byDayMap.put("fridayList", fridayList);
			byDayMap.put("saturdayList", saturdayList);
			
			ClassVO classInfo = classDAO.selectClassInfoByStudentId(id);
			
			
			Map<String,List<TimeTableVO>> ttMap = new HashMap<String, List<TimeTableVO>>();
			
			List<TimeTableVO> weekDayList = timetableDAO.selectWeekDayTimeTableValue();
			List<TimeTableVO> weekEndList = timetableDAO.selectWeekEndTimeTableValue();
			ttMap.put("weekDayList",weekDayList);		
			ttMap.put("weekEndList",weekEndList);
			
			////////////////////////////////////////////////////////////////////////////////
			
			
			/////////////////////////나의 성적/////////////////////////////////////////////////
			
			List<ExamVO> examList = scoreDAO.selectExamByStudent(id);
			
			
			
			
			////////////////////////////////////////////////////////////////////////////////
			
			//////////////////////////////학교 공지 사항/////////////////////////////////////////
			SchoolVO selectSchoolURL = noticeDAO.selectSchoolURL(id);
			String schoolURL = selectSchoolURL.getSchoolURL();
			List<NoticeVO> schoolNoticeList = noticeDAO.selectNoticeListForMain(schoolURL);
			
			
			
			
			//////////////////////////////////////////////////////////////////////////////////
			
			
			Map<String, Object> dataMap = new Hashtable<String, Object>();
			StudentVO selectStudentGetMain = studentDAO.selectStudentGetMain(id);
			ManagerAttandanceVO selectForMain = managerAttandanceDAO.selectForMain(id);
			System.out.println(selectForMain.getAtnDate());
			dataMap.put("id", id);
			dataMap.put("selectChildList", selectChildList);
			dataMap.put("schoolNoticeList", schoolNoticeList);
			dataMap.put("examList", examList);
			dataMap.put("byDayMap", byDayMap);
			dataMap.put("classInfo", classInfo);
			dataMap.put("ttMap", ttMap);
			dataMap.put("selectForMain", selectForMain);
			dataMap.put("selectStudentGetMain", selectStudentGetMain);
			return dataMap;
	}
	
	
}
