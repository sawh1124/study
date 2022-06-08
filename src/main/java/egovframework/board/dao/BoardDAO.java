package egovframework.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.board.bean.BoardBean;
import egovframework.pagination.bean.Search;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession; //connection model1 

	public int insertboard(BoardBean bean) {
		
		return sqlSession.insert("Board.insertboard", bean);
	}

	public List<BoardBean> selectBoardList(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Board.selectBoardList",search);
	}

	public int getBoardListcnt(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Board.getBoardListcnt",search);
	}

	public BoardBean selectBoardOne(int no) {
		
		return sqlSession.selectOne("Board.selectBoardOne",no);
	}

	public void BoardUpdate(BoardBean boardBean) {
		// TODO Auto-generated method stub
		sqlSession.update("Board.BoardUpdate",boardBean);
	}

	public void BoardDelete(BoardBean boardBean) {
		// TODO Auto-generated method stub
		sqlSession.delete("Board.BoardDelete",boardBean);
		
	}


	
	
}
