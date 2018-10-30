package com.jun.service;

import com.jun.dao.PositionDao;
import com.jun.model.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements  PositionService {
    @Autowired
    private PositionDao positionDao;
    public int addPosition(Position position) {
        return positionDao.addPosition(position);
    }

    public Position getaddPositionByname(Position position) {
        return positionDao.getaddPositionByname(position);
    }

    public Position getaddPositionBypoid(Position position) {
        return positionDao.getaddPositionBypoid(position);
    }

    public List<Position> getPositionAll() {
        return positionDao.getPositionAll();
    }

    public List<Position> getPositionBypo_deid(Position position) {
        return positionDao.getPositionBypo_deid(position);
    }

    public int deletePosition(Position position) {
        return positionDao.deletePosition(position);
    }
}
