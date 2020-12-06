package com.laji.mapper;

import java.util.List;

import com.laji.domain.Reader;
import com.laji.vo.ReaderVo;

public interface ReaderMapper {

	List<Reader> queryAllReader(ReaderVo readerVo);

	void insertSelective(ReaderVo readerVo);

	void updateByPrimaryKeySelective(ReaderVo readerVo);

	void deleteByPrimaryKey(Integer readerId);

	String findLastNumber(String barcode);

	Integer queryNumberByBarcode(String readerId);

}
