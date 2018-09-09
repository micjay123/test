package com.lcj.manage.dao;

import com.lcj.manage.model.Sector;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SectorMapper {
    void insertSector(Sector sector);
    List<Sector> selectAllSector();
    void delSector(Sector sector);
    void updateSectorById(Sector sector);
    List<Sector> selectUserWithSector();
    List<Sector> countSector();
}
