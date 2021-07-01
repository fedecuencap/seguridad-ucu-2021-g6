package uy.edu.ucu.seg.g6.business.serviceagent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMailServiceAgent {

	
	
	@Autowired
    private JavaMailSender emailSender;
	
	public void sendEmail(String to, String subject, String text) {
		//segucug6@gmail.com S3g@Ucu-g6
		
		 SimpleMailMessage message = new SimpleMailMessage(); 
	        message.setFrom("segucug6@gmail.com");
	        message.setTo(to); 
	        message.setSubject(subject); 
	        message.setText(text);
	        emailSender.send(message);
		
		
	}
	
}
