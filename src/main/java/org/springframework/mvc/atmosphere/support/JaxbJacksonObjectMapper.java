/*
 * Copyright 2002-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.mvc.atmosphere.support;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.module.jaxb.JaxbAnnotationIntrospector;

/**
 * Customized Jackson {@link ObjectMapper} to add:
 *
 * <ol>
 *     <li>Jaxb annoation support using the {@link JaxbAnnotationIntrospector}</li>
 *     <li>Type Information to the generated JSON</li>
 * </ol>
 * .
 * @author Gunnar Hillert
 * @since 1.0.0
 *
 */
public class JaxbJacksonObjectMapper extends ObjectMapper {

	public JaxbJacksonObjectMapper() {
		final AnnotationIntrospector introspector = new JaxbAnnotationIntrospector(TypeFactory.defaultInstance());
		super.getDeserializationConfig().with(introspector);
		super.getSerializationConfig().with(introspector);

		this.enableDefaultTypingAsProperty(DefaultTyping.JAVA_LANG_OBJECT, JsonTypeInfo.Id.CLASS.getDefaultPropertyName());
	}

}
