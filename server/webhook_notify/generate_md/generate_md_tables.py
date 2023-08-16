# md_table_generator.py


# md_table_generator.py

def generate_md_table(rows):
    """
    自动生成Markdown格式的表格，包括表头
    :param rows: 表格数据行，每个元素是一个字典，表示一行数据，字段名作为字典的键，字段值作为字典的值
    :return: Markdown格式的表格字符串
    """
    # if not rows:
    #     return ""
    #
    # header = list(rows[0].keys())
    #
    # # 构建Markdown表格内容
    # md_content = "| " + " | ".join(header) + " |\n"
    # md_content += "| " + " | ".join(["-" * len(col) for col in header]) + " |\n"
    #
    # for row in rows:
    #     md_content += "| " + " | ".join(str(row[col]) for col in header) + " |\n"
    #
    # return md_content
    # 生成Markdown表头
    header = "| " + " | ".join(rows[0].keys()) + " |\n"
    separator = "| --- |" + " --- |" * (len(rows[0]) - 1) + "\n"

    # 生成Markdown表格内容
    rows_formatted = [f"| {' | '.join(map(str, row.values()))} |" for row in rows]

    # 将表头、分隔符和表格内容拼接为完整的Markdown表格
    markdown_table = header + separator + "\n".join(rows_formatted)

    return markdown_table