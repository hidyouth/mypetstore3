package cus21047.web.mypetstore.service;

import cus21047.web.mypetstore.domain.Record;
import cus21047.web.mypetstore.persistence.RecordDao;
import cus21047.web.mypetstore.persistence.impl.RecordDaoImpl;

import java.util.List;

public class RecordService {
    private RecordDao recordDao;

    public RecordService(){
        this.recordDao = new RecordDaoImpl();
    }
    public List<Record> getRecordList(String userid){
        return this.recordDao.getRecordList(userid);
    }
    public void DeleteRecord(String userid){ this.recordDao.DeleteRecord(userid);}
    public void InsertToRecord(String userid, String records){this.recordDao.InsertToRecord(userid,records);}
}
