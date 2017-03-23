/*
 * Copyright 2001-2012 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.mybatis.handler;

/**
 * 处理模糊查询时的参数转换及特殊字符. 目前仅支持%xxxx%的形式. 目前测试支持的数据库：Mysql5.0,Mysql5.5.
 * 
 * <pre>
 * 参考用例:
 * 
 * where ECTABLE_COLUMN_DETAIL.DISPLAY_NAME like  #{displayName,javaType=Like,jdbcType=VARCHAR} escape '/'
 * </pre>
 * 
 * @author zx.
 * @since 1.0
 * @version 1.0
 */
public class MysqlLikeTypeHandler extends LikeTypeHandler {
    /**
     * 自定义转义符 \
     */
    static final String ECSAPE_SLASH = "//";
    
    @Override
    public String getEscape() {
        return ECSAPE_SLASH;
    }
}
