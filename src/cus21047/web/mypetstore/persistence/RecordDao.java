package cus21047.web.mypetstore.persistence;

import cus21047.web.mypetstore.domain.Record;

import java.util.List;

public interface RecordDao {
    List<Record> getRecordList(String userid);

    void InsertToRecord(String userid, String records,int isItem);

    void DeleteRecord(String userid);


}
