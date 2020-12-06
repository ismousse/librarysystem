package com.laji.utils;

import java.util.ArrayList;
import java.util.List;

public class TreeNodeBuilder {
	/**
	 * 把TreeNode变成那种含别的菜单的菜单
	 * @param nodes
	 * @param topPid
	 * @return
	 */
	public static List<TreeNode> builder(List<TreeNode> nodes, Integer topPid) {
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		for (TreeNode n1 : nodes) {	//先找第一层
			if (n1.getPid() == topPid) {
				treeNodes.add(n1);
			}
			for (TreeNode n2 : nodes) { //再找第二层
				if (n2.getPid() == n1.getId()) {
					n1.getChildren().add(n2);
				}
			}
		}
		return treeNodes;
	}
}
