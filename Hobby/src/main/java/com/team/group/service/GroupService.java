package com.team.group.service;

import java.util.List;

import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.report.vo.ReportVO;
import com.team.user.vo.UserVO;

public interface GroupService {

	public List<GroupVO> getAllGroups();
	
	// group select * no paging
	public List<GroupVO> getAllGroupsNoPaging();
	
	// 전체 게시물의 수
	public int getTotalCount() ;
	// 페이징처리를 위한 리스트
	public List<GroupVO> getAllGroups(int offset, int limit);
	//검색
	public List<GroupVO> searchGroups(GroupVO gvo);
	// 글쓰기
	public int getGroupWriteOk(GroupVO gvo);
	// 관리자로 모임 생성
	public int getGroupAdminWrite(GroupVO gvo);
	// 상세보기
	public GroupVO getGroupOnelist(String g_idx);
	// 참여하기
	public int checkUserParticipation(String g_idx, String u_idx);
	public void joinGroup(String g_idx, String u_idx);
	public void cancelParticipation(String g_idx, String u_idx);
	// 삭제하기
	public int getGroupDelete(GroupVO g_idx);
	// 삭제 복구하기
	public int getGroupRevive(GroupVO gvo);
	// 수정하기
	public int getGroupUpdate(GroupVO gvo);
	// 댓글 가져오기
	public List<GroupCmtVO> getCommList(String g_idx);
	// 댓글 사용자 정보 가져오는 메서드 추가
	public UserVO getUserCmtInfo(String u_idx); 
	// 댓글 삽입
	public int getCommInsert(GroupCmtVO gcvo);
	// 댓글 삭제
	public int commentDel(GroupCmtVO gcvo);
	// 제목으로 상세 검색
	public List<GroupVO> getListByTitle(String title);
	// 닉네임으로 상세 검색
	public List<GroupVO> getListByNickname(String nickname); 
	// 날짜로 모임 찾기
	public List<GroupVO> getListByDate(String date);
	// 위치로 모임 찾기
	public List<GroupVO> getListByLocation(String location);
	// 오래된 모임 g_status=3 처리
	public int filterOldGroups();
	
	
	
	
	
	int insertMember(String g_idx,String u_idx);
	
}
