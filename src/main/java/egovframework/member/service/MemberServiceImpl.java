package egovframework.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.member.bean.MemberBean;
import egovframework.member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public int insertMember(MemberBean bean) {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(bean);
	}

	@Override
	public int selectLogin(MemberBean bean) {
		// TODO Auto-generated method stub
		return memberDAO.selectLogin(bean);
	}

	@Override
	public int joinIdCheck(String id) {
		// TODO Auto-generated method stub
		return memberDAO.joinIdCheck(id);
	}

	@Override
	public MemberBean selectMemberOne(String id) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberOne(id);
	}

	@Override
	public void updateMember(MemberBean bean) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(bean);
	}
	

	
}
