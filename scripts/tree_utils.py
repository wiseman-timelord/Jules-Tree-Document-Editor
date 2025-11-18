import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

def serialize_tree(treestore):
    data = []
    tree_iter = treestore.get_iter_first()
    while tree_iter:
        node = {"text": treestore.get_value(tree_iter, 0), "children": []}
        if treestore.iter_has_child(tree_iter):
            child_iter = treestore.iter_children(tree_iter)
            node["children"] = serialize_children(treestore, child_iter)
        data.append(node)
        tree_iter = treestore.iter_next(tree_iter)
    return data

def serialize_children(treestore, tree_iter):
    data = []
    while tree_iter:
        node = {"text": treestore.get_value(tree_iter, 0), "children": []}
        if treestore.iter_has_child(tree_iter):
            child_iter = treestore.iter_children(tree_iter)
            node["children"] = serialize_children(treestore, child_iter)
        data.append(node)
        tree_iter = treestore.iter_next(tree_iter)
    return data

def deserialize_tree(data, treestore, parent):
    for node in data:
        new_iter = treestore.append(parent, [node["text"]])
        if "children" in node:
            deserialize_tree(node["children"], treestore, new_iter)
