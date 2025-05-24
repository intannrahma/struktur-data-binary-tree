class BinarySearchTree<T> {
  STNode<T> root;
  int treeSize;

  void RemoveNode(STNode<T>? dNode) {
    if (dNode == null) {
      return;
    }
    STNode<T>? pNode, rNode;
    pNode = dNode.parent;
    // Node yang dihapus mempunyai satu anak
    if (dNode.left == null || dNode.right == null) {
      if (dNode.right == null) {
        rNode = dNode.left;
      } else {
        rNode = dNode.left;
      }
      if (rNode != null) {
        print("Ngeset Parent");
        rNode.parent = pNode;
      }
      // Menghapus node root
      if (pNode == null) {
        root = rNode;
      } else if ((dNode.nodeValue as Comparable<T>).compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    } 
    // Node yang dihapus mempunyai dua anak
    else {
      STNode<T>? pOfRNode = dNode;
      rNode = dNode.right;
      pOfRNode = dNode;
      while (rNode!.left != null) {
        pOfRNode = rNode;
        rNode = rNode.left;
      }
      dNode.nodeValue = rNode.nodeValue;
      if (pOfRNode == dNode) {
        dNode.right = rNode.right;
      } else {
        pOfRNode!.left = rNode.right;
      }
      if (rNode.right != null) {
        rNode.right!.parent = pOfRNode;
      }
    }
  }
}



