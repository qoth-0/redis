sudo apt-get update

sudo apt-get install -y redis-server # redis 다운로드

redis-server —version 

redis-cli  # 접속

# 데이터베이스 선택(0~15)
select 1

# String
SET key value # key에 값 설정
GET key  # key의 값 가져옴
SET key value nx # nx(not exist로 키가 존재하지 않을때 적용)
SET key value ex 3600 # ex(만료시간-초단위)
keys * # 모든 key 조회
DEL key # 특정 key 삭제
FLUSHDB # 현재 데이터베이스의 모든 key 삭제

# List
LPUSH key member # 데이터 왼쪽 삽입
RPUSH key member # 데이터 오른쪽 삽입
LPOP key # 왼쪽 데이터 추출 후 제거
RPOP key # 오른쪽 데이터 추출 후 제거
LLEN key # 데이터 개수 조회
lrange key 0 -1 # 전체 member 조회
expire key 3600 # 만료시간 지정
ttl key # 남은 만료시간 확인

# Set
SADD set member # 멤버 추가
SMEMBERS set # 모든 멤버 반환
SREM set member1 member2 # 특정 멤버 삭제
SCARD set # 멤버 개수 반환

# ZSet
ZADD zset 1 member1 # score 1에 member1
ZREM zset member1 # 특정 키의 특정 멤버 삭제
ZRANK zset member1 # 특정 멤버의 위치 정보 반환(0부터 시작)
ZRANGE zset 0 -1 # score기준 오름차순 조회
ZREVRANGE zset 0 -1 # score기준 내림차순 조회

# 좋아요 기능 구현
SET like 0 # 0부터 시작
INCR like # 특정 key값 증가
DECR like # 특정 key값 감소
GET like # 현재 좋아요수
