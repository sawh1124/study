package egovframework.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.board.bean.BoardBean;
import egovframework.board.dao.BoardDAO;
import egovframework.pagination.bean.Search;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public int insertboard(BoardBean bean) {
		// TODO Auto-generated method stub
		return boardDAO.insertboard(bean);
	}

	@Override
	public List<BoardBean> selectBoardList(Search search) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(search);
	}

	@Override
	public int getBoardListcnt(Search search) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardListcnt(search);
	}

	@Override
	public BoardBean selectBoardOne(int no) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardOne(no);
	}

	@Override
	public void BoardUpdate(BoardBean boardBean) {
		// TODO Auto-generated method stub
		boardDAO.BoardUpdate(boardBean);
	}

	@Override
	public void BoardDelete(BoardBean boardBean) {
		// TODO Auto-generated method stub
		boardDAO.BoardDelete(boardBean);
		
	}

	

	
}
