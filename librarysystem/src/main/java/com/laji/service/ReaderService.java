package com.laji.service;

import com.laji.utils.DataGridView;
import com.laji.vo.ReaderVo;

public interface ReaderService {

	DataGridView queryAllReader(ReaderVo readerVo);

	void addReader(ReaderVo readerVo);

	void updateReader(ReaderVo readerVo);

	void deleteReader(Integer readerId);

	void deleteBatchReader(Integer[] ids);

	String findLastNumber(String barcode);

	Integer queryNumberByBarcode(String readerId);

}
