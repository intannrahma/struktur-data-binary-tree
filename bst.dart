class Node<T> {
  T nodeValue;
  Node<T>? left,right,parent;

  Node(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  Node<T>? root;
  int treeSize = 0;

  bool insertdata(T newValue) {
    Node<T>? current = root,parent;
    int orderValue = 0;

    while(current != null) {
      parent = current;
      orderValue = newValue.compareTo(current.nodeValue);

      if (orderValue == null) {
        return false;
      } else if (orderValue < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    Node<T> newNode = Node(newValue, parent);
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

void main() {
  BinarySearchTree bst = BinarySearchTree();

  bst.insertdata(30);
  bst.insertdata(45);
  bst.insertdata(20);
}
