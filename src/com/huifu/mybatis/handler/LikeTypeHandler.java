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

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.huifu.base.LogFactory;


/**
 * 处理模糊查询时的参数转换及特殊字符. 目前仅支持%xxxx%的形式. 目前测试支持的数据库：Oracle10g,SqlServer2005
 * 
 * <pre>
 * 参考用例:
 * 
 * where ECTABLE_COLUMN_DETAIL.DISPLAY_NAME like  #{displayName,javaType=Like,jdbcType=VARCHAR} escape '\'
 * </pre>
 * 
 * @author zx.
 * @since 1.0
 * @version 1.0
 */
public class LikeTypeHandler extends BaseTypeHandler<String> {
    
    /**
     * 通配符 %
     */
    static final String WILDCARD_PERCENT_SIGN   = "%";
    /**
     * 通配符 _
     */
    static final String WILDCARD_UNDERLINE      = "_";
    
    /**
     * 范围通配符 [
     */
    static final String WILDCARD_LEFT_BRACKETS  = "[";
    
    /**
     * 范围通配符 ]
     */
    static final String WILDCARD_RIGHT_BRACKETS = "]";
    
    /**
     * 自定义转义符 \
     */
    static final String ECSAPE_SLASH            = "\\";
    
    @Override
    public String getNullableResult(ResultSet arg0, String arg1) throws SQLException {
        return arg0.getString(arg1);
    }
    
    @Override
    public String getNullableResult(CallableStatement arg0, int arg1) throws SQLException {
        return arg0.getString(arg1);
    }
    
    @Override
    public String getNullableResult(ResultSet arg0, int arg1) throws SQLException {
        return arg0.getString(arg1);
    }
    
    @Override
    public void setNonNullParameter(PreparedStatement arg0, int arg1, String arg2, JdbcType arg3) throws SQLException {
        String likeParam = arg2;
        // 替换所有的转义字符
        likeParam = StringUtils.replace(likeParam, getEscape(), getEscape() + getEscape());
        // 替换所有%
        likeParam = StringUtils.replace(likeParam, WILDCARD_PERCENT_SIGN, getEscape() + WILDCARD_PERCENT_SIGN);
        // 替换所有_
        likeParam = StringUtils.replace(likeParam, WILDCARD_UNDERLINE, getEscape() + WILDCARD_UNDERLINE);
        
        // TODO [] 的使用正则测试中.
        // 替换所有[
        // likeParam = StringUtils.replace(likeParam, WILDCARD_LEFT_BRACKETS,
        // getEscape() + WILDCARD_LEFT_BRACKETS);
        // 替换所有]
        // likeParam = StringUtils.replace(likeParam, WILDCARD_RIGHT_BRACKETS,
        // getEscape() + WILDCARD_RIGHT_BRACKETS);
        
        // 将模糊匹配的通配符%拼入
        likeParam = WILDCARD_PERCENT_SIGN + likeParam + WILDCARD_PERCENT_SIGN;
        LogFactory.LOGGER_FRAMEWORK.debug("like param :" + likeParam);
        arg0.setString(arg1, likeParam);
        // arg0.setString(arg1, likeParam + " escape '\\'");
    }
    
    String getEscape() {
        return ECSAPE_SLASH;
    }
    
}
