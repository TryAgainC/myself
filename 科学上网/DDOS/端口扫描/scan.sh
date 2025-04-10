#!/bin/bash
# 判断 ip.txt 文件是否存在
if [ ! -f ip.txt ]; then
    echo "ip.txt 文件不存在，请确认文件在当前目录下。"
    exit 1
fi

# 清空或创建结果文件
> result.txt

# 逐行读取 ip.txt 文件中的 IP
while IFS= read -r ip; do

    # 去除可能存在的回车符
    ip=$(echo "$ip" | tr -d '\r')
    echo "正在扫描 $ip ..."
    # 使用 nmap 扫描全部端口（-p-）并提高扫描速度（-T4）
    # 这里用 grep 和 awk 提取出状态为 open 的端口号
    open_ports=$(nmap -T4 -p- "$ip" 2>/dev/null | grep "/tcp" | grep "open" | awk -F'/' '{print $1}' | tr '\n' ',' | sed 's/,$//')
    # 将结果写入 result.txt 文件中，每一行对应一个 IP 的开放端口
    echo "$open_ports" >> result.txt
done < ip.txt

echo "扫描完成，结果已保存至 result.txt 文件。"
