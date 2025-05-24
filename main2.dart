class STNode<T> {
  T nodeValue;
  STNode<T>? left;
  STNode<T>? right;
  STNode<T>? parent;

  STNode(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int treeSize = 0;

  BinarySearchTree() {
    root = null;
  }

  bool add(T item) {
    STNode<T>? t = root;
    STNode<T>? parent;
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

  STNode<T>? findNode(T item) {
    STNode<T>? t = root;
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

  bool find(T item) {
    STNode<T>? t = findNode(item);
    return t != null;
  }
}

void main() {
  BinarySearchTree<int> bst = BinarySearchTree();
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);

  print('Tree Size: ${bst.treeSize}');

  var node = bst.findNode(5);
  if (node != null) {
    print('Node found with value: ${node.nodeValue}');
  } else {
    print('Node not found.');
  }

  bool found = bst.find(5);
  if (found) {
    print('Node found');
  } else {
    print('Node not found.');
  }
}
