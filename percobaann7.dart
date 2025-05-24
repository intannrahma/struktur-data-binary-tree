class BinaryTree<T> {

  void deleteDeepest(Node root, Node delNode) {
    Queue<Node> q = Queue();
    q.add(root);
    Node? temp;
    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp == delNode) {
        temp = null;
        return;
      }
      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          q.add(temp.right!);
        }
      }
      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          q.add(temp.left!);
        }
      }
    }
  }

  void delete(Node? root, int key) {
    if (root == null) {
      return;
    }
    if (root.left == null && root.right == null) {
      if (root.key == key) {
        root = null;
      }
      return;
    }
    Queue<Node> q = Queue();
    q.add(root);
    Node? temp;
    Node? keyNode;
    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp.key == key) {
        keyNode = temp;
      }
      if (temp.left != null) {
        q.add(temp.left!);
      }
      if (temp.right != null) {
        q.add(temp.right!);
      }
    }
    if (keyNode != null) {
      dynamic x = temp!.key;
      deleteDeepest(root, temp);
      keyNode.key = x;
    }
  }
}
