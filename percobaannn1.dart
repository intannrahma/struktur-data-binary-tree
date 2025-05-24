class BinarySearchTree<T> {
  STNode<T>? root;
  int treeSize = 0;
  BinarySearchTree() {
    root = null;
  }

  bool add(T item) {
    STNode<T> t = root, parent;
    int orderValue = 0;
    while (t != null) {
      parent = t;
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) {
        return false;
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }
    STNode<T> newNode = STNode(item, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }
    treeSize++;
    return true;
  }
}
