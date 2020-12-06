package com.laji.service;

import com.laji.utils.DataGridView;
import com.laji.vo.BorrowVo;

public interface BorrowService {

	void addBorrow(BorrowVo borrowVo);

	void updateBorrow(BorrowVo borrowVo);

	void deleteBorrow(Integer id);

	DataGridView queryAllBorrow(BorrowVo borrowVo);

	Integer queryBorrowCount(String readerId);

	DataGridView queryBestReader();

	DataGridView queryBestBook();

	DataGridView queryAllBorrowByRid(BorrowVo borrowVo);

}
