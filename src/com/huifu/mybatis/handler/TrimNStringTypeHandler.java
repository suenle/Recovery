/*
 * Copyright 2001-2012 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.mybatis.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.huifu.base.LogFactory;


/**
 * @author zx.
 * @since 1.0
 * @version 1.0
 */
public class TrimNStringTypeHandler extends BaseTypeHandler<String> {
    
    /**
     * {@inheritDoc}
     * 
     * @see org.apache.ibatis.type.NStringTypeHandler#setNonNullParameter(java.sql.PreparedStatement,
     *      int, java.lang.String, org.apache.ibatis.type.JdbcType)
     */
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType)
            throws SQLException {
        LogFactory.LOGGER_FRAMEWORK.debug("Original parameter is " + parameter);
        parameter = Utils.trim(parameter);
        LogFactory.LOGGER_FRAMEWORK.debug("Trimmed parameter is " + parameter);
        ps.setString(i, parameter);
    }
    
    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        // return rs.getNString(columnName);
        return rs.getString(columnName);
    }
    
    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return rs.getString(columnIndex);
    }
    
    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        // return cs.getNString(columnIndex);
        return cs.getString(columnIndex);
    }
    
}
