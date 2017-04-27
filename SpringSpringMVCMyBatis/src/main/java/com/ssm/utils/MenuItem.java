package com.ssm.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class MenuItem {
    private int id;// :节点id,这个很重要到加载远程服务器数据 which is important to load remote
    // data
    private String text;// : 显示的节点文本
    private String state;// : 节点状态, 'open' 或者 'closed', 默认是 'open'. 当设置为
    // 'closed', 节点所有的子节点将从远程服务器站点加载
    private boolean checked;// : 指明检查节点是否选中.
    private Set<Map<String, String>> attributes;// : 可以添加到节点的自定义属性
    private List<MenuItem> children;// : 一个节点数组,定义一些子节点

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Set<Map<String, String>> getAttributes() {
        return attributes;
    }

    public void setAttributes(Set<Map<String, String>> attributes) {
        this.attributes = attributes;
    }

    public List<MenuItem> getChildren() {
        return children;
    }

    public void setChildren(List<MenuItem> children) {
        this.children = children;
    }

}
