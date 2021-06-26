package uy.edu.ucu.seg.g6.web.config;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;

import org.dozer.DozerBeanMapper;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
 
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "uy.edu.ucu.seg.g6")
@EntityScan(basePackages = "uy.edu.ucu.seg.g6.*")   
@EnableJpaRepositories(basePackages = "uy.edu.ucu.seg.g6.business.repositories")
@EnableJpaAuditing
public class AppConfiguration implements WebMvcConfigurer{
    
	
   public void configureViewResolvers(ViewResolverRegistry registry) {
       InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
       viewResolver.setViewClass(JstlView.class);
       viewResolver.setPrefix("/WEB-INF/views/");
       viewResolver.setSuffix(".jsp");
       registry.viewResolver(viewResolver);
   }

   public void addResourceHandlers(ResourceHandlerRegistry registry) {
       registry.addResourceHandler("/static/**").addResourceLocations("/static/");
   }

   @Bean
	public FilterRegistrationBean<Filter> siteMeshFilter(){
		FilterRegistrationBean<Filter> fitler = new FilterRegistrationBean<Filter>();
		SitemeshFilter siteMeshFilter = new SitemeshFilter();
		fitler.setFilter(siteMeshFilter);
		return fitler;
	}
   
	@Bean(name = "mapper-factory")
	public DozerBeanMapper mapperFactory() {
		List<String> mappingFiles = new ArrayList<>();
		mappingFiles.add("dozerJdk8Converters.xml");

		DozerBeanMapper dozerBeanMapper = new DozerBeanMapper();
		dozerBeanMapper.setMappingFiles(mappingFiles);
		return dozerBeanMapper;	
	}

}