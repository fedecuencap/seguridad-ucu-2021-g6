package uy.edu.ucu.seg.g6.web.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshFilter extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addExcludedPath("/app/login");
		builder.addExcludedPath("/app/registro");
		builder.addDecoratorPath("/*", "/WEB-INF/decorator/main-layout.jsp");
	}
}