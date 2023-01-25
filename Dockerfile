FROM python:3
COPY . /usr/src/app
WORKDIR /usr/src/app
ENV LINK http://www.meetup.com/cloudyuga/
ENV TEXT1 Welcome To 
ENV TEXT2 EKS Deployment
ENV LOGO https://raw.githubusercontent.com/cloudyuga/rsvpapp/master/static/cloudyuga.png
ENV COMPANY CloudYuga Technology Pvt. Ltd.
RUN pip3 install -r requirements.txt
CMD python rsvp.py
