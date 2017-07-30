package com.minstone.common.gx.gen.test;


import java.util.Iterator;

import org.dom4j.Element;
import org.junit.Test;

import com.minstione.common.gen.util.TemplateUtil;

public class TestConfig {

	@Test
	public void testSS() {
		Element confElement = TemplateUtil.getConfElement();
		// 获取所有的模板元素
		Element paramListElements = confElement.element("paramMap");
		Iterator elementIterator = paramListElements.elementIterator();
		while (elementIterator.hasNext()) {
			Element mapElement = (Element) elementIterator.next();
			System.out.println(mapElement.getName());
			System.out.println(mapElement.getText());
//			Element paramElement = (Element) paramListElements.next();
//			String key = tplElement.elementText("key");
//			String value = tplElement.elementText("value");
//			paramMap.put(key, value);
		}
	}
}
