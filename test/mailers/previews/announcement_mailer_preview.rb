# Preview all emails at http://localhost:3000/rails/mailers/announcement_mailer
class AnnouncementMailerPreview < ActionMailer::Preview
	def new_announcement
    email = "test@email.com"
    first_name = "Jim"
    announcement = Announcement.new(title_en: "This is a test", title_fr: "This is a test in French",
    	body_en: "Bacon ipsum dolor amet turducken venison frankfurter, beef ribs biltong chislic boudin leberkas. Capicola boudin ground round prosciutto tri-tip doner ribeye meatloaf. Alcatra biltong beef ribs, frankfurter burgdoggen boudin sirloin pig short ribs pork loin turkey rump bacon porchetta. Buffalo pork belly ham hock tenderloin turducken. Shankle meatloaf sirloin buffalo.

Tri-tip shankle t-bone frankfurter, strip steak tenderloin pork alcatra hamburger andouille pancetta chislic. Fatback tail prosciutto alcatra bresaola pork pastrami picanha pork belly salami tenderloin. Salami kielbasa ball tip, ham hock swine shank pancetta leberkas porchetta doner tri-tip ham bacon kevin. Brisket biltong doner corned beef.

Hamburger sausage short loin ball tip tongue. Short ribs chislic venison, t-bone alcatra strip steak kielbasa sausage pork belly. Filet mignon cupim meatball, capicola short loin venison sausage leberkas ham hock shank boudin drumstick pastrami salami. T-bone tenderloin sausage venison, short ribs sirloin bresaola frankfurter pork belly tongue meatloaf beef. Shankle sirloin tenderloin turducken capicola. Ham hock shank landjaeger, shoulder frankfurter kevin flank beef. Pork tail sirloin, filet mignon cupim bacon pork belly beef ribs ground round tri-tip ham hock corned beef pig.",
		body_fr: "Bacon ipsum dolor amet turducken venison frankfurter, beef ribs biltong chislic boudin leberkas. Capicola boudin ground round prosciutto tri-tip doner ribeye meatloaf. Alcatra biltong beef ribs, frankfurter burgdoggen boudin sirloin pig short ribs pork loin turkey rump bacon porchetta. Buffalo pork belly ham hock tenderloin turducken. Shankle meatloaf sirloin buffalo.

Tri-tip shankle t-bone frankfurter, strip steak tenderloin pork alcatra hamburger andouille pancetta chislic. Fatback tail prosciutto alcatra bresaola pork pastrami picanha pork belly salami tenderloin. Salami kielbasa ball tip, ham hock swine shank pancetta leberkas porchetta doner tri-tip ham bacon kevin. Brisket biltong doner corned beef.

Hamburger sausage short loin ball tip tongue. Short ribs chislic venison, t-bone alcatra strip steak kielbasa sausage pork belly. Filet mignon cupim meatball, capicola short loin venison sausage leberkas ham hock shank boudin drumstick pastrami salami. T-bone tenderloin sausage venison, short ribs sirloin bresaola frankfurter pork belly tongue meatloaf beef. Shankle sirloin tenderloin turducken capicola. Ham hock shank landjaeger, shoulder frankfurter kevin flank beef. Pork tail sirloin, filet mignon cupim bacon pork belly beef ribs ground round tri-tip ham hock corned beef pig."
    	)
    subject = announcement.title
    content = announcement.body
    AnnouncementMailer.new_announcement(email: email, first_name: first_name, subject: subject, content: content)
  end

end
