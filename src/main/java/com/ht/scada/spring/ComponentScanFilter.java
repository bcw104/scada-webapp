package com.ht.scada.spring;

import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.core.type.filter.TypeFilter;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 *
 * @author: 薄成文 13-5-23 下午12:26
 * To change this template use File | Settings | File Templates.
 */
public class ComponentScanFilter implements TypeFilter {
    @Override
    public boolean match(MetadataReader metadataReader, MetadataReaderFactory metadataReaderFactory) throws IOException {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
