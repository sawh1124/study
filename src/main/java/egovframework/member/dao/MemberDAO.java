package egovframework.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.member.bean.MemberBean;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession; //connection model1 

	public int insertMember(MemberBean bean) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Member.insertMember", bean);
	}

	public int selectLogin(MemberBean bean) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectLogin",bean);
	}

	public int joinIdCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.joinIdCheck",id);
	}

	public MemberBean selectMemberOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectMemberOne", id);
	}

	public void updateMember(MemberBean bean) {
		// TODO Auto-generated method stub
		sqlSession.update("Member.updateMember", bean);
	}

	
	
}
