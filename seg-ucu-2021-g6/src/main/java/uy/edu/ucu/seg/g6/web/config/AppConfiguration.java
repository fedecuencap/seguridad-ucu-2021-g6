package uy.edu.ucu.seg.g6.web.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.Filter;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
public class AppConfiguration implements WebMvcConfigurer {

	@Autowired
	private Environment env;

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
	public FilterRegistrationBean<Filter> siteMeshFilter() {
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

	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(env.getProperty("email.host", "smtp.gmail.com"));
		mailSender.setPort(env.getProperty("email.port", Integer.class, 587));
		mailSender.setUsername(env.getProperty("email.username", "segucug6@gmail.com"));
		mailSender.setPassword(env.getProperty("email.password", "S3g@Ucu-g6"));

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", env.getProperty("email.transport.protocol", "smtp"));
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;
	}

}