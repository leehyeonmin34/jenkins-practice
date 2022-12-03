FROM openjdk:11-jdk

# 개발자
MAINTAINER leehyeonmin34

# 호스트(weather-reminder-node)와 공유할 폴더. 컨테이너(openjdk)의 경로(아래 값)의 폴더를,
# 호스트의 /var/lib/docker/volumnes/[hashValue]의 디렉토리에 저장하게 된다.
VOLUME /deploy/weather-reminder

# 빌드 파일들을 하나의 jar(app.jar)로 묶어 실행
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]