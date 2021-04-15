FROM alpine
#声明作者
LABEL maintainer="a little <little@autre.cn> https://coding.autre.cn"
#更改源，升级内核及软件
RUN set -x \
    ##&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    ##设置时区
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata \
    ##清除安装软件及缓存
    && rm -rf /tmp/* /var/cache/apk/*
ENTRYPOINT ["/bin/sh"]
