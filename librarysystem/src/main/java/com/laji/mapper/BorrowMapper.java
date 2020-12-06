package com.laji.mapper;

import java.util.List;

import com.laji.domain.Borrow;
import com.laji.vo.BorrowVo;

public interface BorrowMapper {

	List<Borrow> queryAllBorrow(BorrowVo borrowVo);

	void insertSelective(BorrowVo borrowVo);

	void updateByPrimaryKeySelective(BorrowVo borrowVo);

	void deleteByPrimaryKey(Integer id);

	Integer queryBorrowCount(String readerId);

	List<Borrow> queryBestReader();

	List<Borrow> queryBestBook();

	List<Borrow> queryAllBorrowByRid(BorrowVo borrowVo);

}
