package com.huifu.mybatis.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.huifu.base.LogFactory;


/**
 * UUID主键生成器
 * 
 * <pre>
 * 参考用例:
 * 
 * #{id,javaType=UUID,jdbcType=VARCHAR}
 * </pre>
 * 
 * @author zx.
 * @since 1.0
 * @version 1.0
 */
public class UUIDTypeHandler extends BaseTypeHandler<String> {
    
    @Override
    public String getNullableResult(ResultSet arg0, String arg1) throws SQLException {
        return arg0.getString(arg1);
    }
    
    @Override
    public String getNullableResult(CallableStatement arg0, int arg1) throws SQLException {
        return arg0.getString(arg1);
    }
    
    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return rs.getString(columnIndex);
    }
    
    @Override
    public void setNonNullParameter(PreparedStatement arg0, int arg1, String arg2, JdbcType arg3) throws SQLException {
        String uuid = UUID.randomUUID().toString().replaceAll("\\-", "").toUpperCase();
        LogFactory.LOGGER_FRAMEWORK.debug("uuid param :" + uuid);
        arg0.setString(arg1, uuid);
    }
    
}
