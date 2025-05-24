class BinarySearchTree<T> {
  
  STNode<T> findNode(T item) {
    STNode<T> t = root, parent = null;
    int orderValue = 0;
   
    while (t != null) {
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) {
        return t;
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }
    return null;
  }
}
