class BinarySearchTree<T> {
  
  bool find(T item) {
    STNode<T> t = findNode(item);
    if (t != null) {
      T value = t.nodeValue;
      return true;
    }
    return false;
  }
}
