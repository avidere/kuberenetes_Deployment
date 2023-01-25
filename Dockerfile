FROM python:3
COPY . /usr/src/app
WORKDIR /usr/src/app
ENV LINK http://www.meetup.com/cloudyuga/
ENV TEXT1 Welcome To 
ENV TEXT2 EKS Deployment
ENV LOGO https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/1200px-Kubernetes_logo_without_workmark.svg.png
ENV COMPANY Devops Technology Pvt. Ltd.
RUN pip3 install -r requirements.txt
CMD python rsvp.py
