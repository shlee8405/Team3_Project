package com.team.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team.user.dao.UserDAO;
import com.team.user.vo.NaverVO;
import com.team.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	 @Autowired
	    private BCryptPasswordEncoder passwordEncoder;

	@Override
	public List<UserVO> getAllUsers() {
		return userDAO.getAllUsers();
	}

	@Override
	public int getUsersToday() {
		return userDAO.getUsersToday();
	}

	@Override
	public int getUserInsert(UserVO uvo) {
		return userDAO.getUserInsert(uvo);
	}

	@Override
	public int getUserInsertKakao(UserVO uvo) {
		return userDAO.getUserInsertKakao(uvo);
	}

	@Override
	public String getUserPass(UserVO uvo) {
		return userDAO.getUserPass(uvo);
	}


	@Override
	public int getUserCount(String u_id) {
		return userDAO.getUserCount(u_id);
	}

	@Override
	public UserVO getUserVoWithId(String u_id) {
		return userDAO.getUserVoWithId(u_id);
	}
	
	@Override
    public boolean isEmailDuplicate(String email) {
        int count = userDAO.idCheck(email);
        return count > 0;
    }



	@Override
	public boolean isIdDuplicate(String id) {
		int count = userDAO.idCheck2(id);
        return count > 0;
	}



	@Override
	public String findIdByEmail(String email) {
		return userDAO.findIdByEmail(email);
	}



	 @Override
    public UserVO findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }

    @Override
    public String generateNewPassword() {
        // Implement password generation logic (e.g., using random characters)
        return "newGeneratedPassword";
    }

    @Override
    public boolean updateUserPassword(String u_id, String newPassword) {
        // Encrypt the new password before updating
        String encryptedPassword = passwordEncoder.encode(newPassword);
        int updatedRows = userDAO.updateUserPassword(u_id, encryptedPassword);
        return updatedRows > 0;
    }


    @Override
    public int getAdminInsert(UserVO uvo) {
    	int res = userDAO.getAdminInsert(uvo);
    	return res;
    }

    
    @Override
    public int getBanUser(String idx) {
    	return userDAO.getBanUser(idx);
    }
	
    @Override
    public int getUnbanUser(String idx) {
    	return userDAO.getUnbanUser(idx);
    }
    
    @Override
    public int getDeleteUser(String u_idx) {
    	return userDAO.getDeleteUser(u_idx);
    }
    
    @Override
    public int getUpdateUserAdmin(UserVO uvo) {
    	return userDAO.getUpdateUserAdmin(uvo);
    }

	@Override
	public List<UserVO> getUsers(String u_idx) {
		return userDAO.getUsers(u_idx);
	}
	
	@Override
	public int pass(String u_idx, String encodedNewPassword) {
		return userDAO.pass(u_idx,encodedNewPassword);
	}
	
	@Override
	public List<UserVO> getUsersWithNickname(String u_nickname) {
		return userDAO.getUsersWithNickname(u_nickname);
	}
	
	@Override
	public List<UserVO> getUsersWithBirthday(String u_birthday) {
		return userDAO.getUsersWithBirthday(u_birthday);
	}
	
	@Override
	public List<UserVO> getUsersWithPhone(String u_phone) {
		return userDAO.getUsersWithPhone(u_phone);
	}



	@Override
	public String findPwByEmail(String finalemail) {
		return userDAO.findPwByEmail(finalemail);
	}
	
	@Override
	public int PassToID(String finalemail, String encodedNewPassword) {
		return userDAO.PassToID(finalemail,encodedNewPassword);
	}
	
	
	// 네이버 로그인
	@Override
	public int naver(NaverVO naverVO) {
		return userDAO.naver(naverVO);
	}
	
	@Override
	public String getNaverUserByEmail(String id) {
		return userDAO.getNaverUserByEmail(id);
	}

}
