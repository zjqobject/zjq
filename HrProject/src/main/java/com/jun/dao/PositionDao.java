package com.jun.dao;

import com.jun.model.Position;

import java.util.List;

public interface PositionDao {
    int addPosition(Position position);
    Position getaddPositionByname(Position position);
    Position getaddPositionBypoid(Position position);
    List<Position> getPositionAll();
    List<Position> getPositionBypo_deid(Position position);
    int deletePosition(Position position);
}
