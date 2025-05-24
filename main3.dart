class STNode<T> {
  T nodeValue;
  STNode<T>? parent;
  STNode<T>? left;
  STNode<T>? right;

  STNode(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int treeSize = 0;

  BinarySearchTree() {
    root = null;
    treeSize = 0;
  }

  bool add(T item) {
    STNode<T>? t = root;
    STNode<T>? parent;  // harus diinisialisasi null dulu
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
    if (t != null) {
      return true;
    }
    return false;
  }

  void RemoveNode(STNode<T>? dNode) {
    if (dNode == null) {
      return;
    }
    STNode<T>? pNode = dNode.parent;
    STNode<T>? rNode;

    // Node yang dihapus mempunyai satu anak atau tidak punya anak
    if (dNode.left == null || dNode.right == null) {
      if (dNode.right == null) {
        rNode = dNode.left;
      } else {
        rNode = dNode.right;  // sebelumnya salah: dNode.left
      }
      if (rNode != null) {
        print("Ngeset Parent");
        rNode.parent = pNode;
      }
      // Menghapus node root
      if (pNode == null) {
        root = rNode;
      } else if ((dNode.nodeValue as Comparable).compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    } 
    // Node yang dihapus mempunyai dua anak
    else {
      STNode<T>? pOfRNode = dNode;
      rNode = dNode.right;

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

    treeSize--;
  }

  STNode<T>? getRoot() => root;

  // Traversal inorder (static atau instance, disini instance)
  void InOrderDisplay(STNode<T>? node) {
    if (node == null) return;
    InOrderDisplay(node.left);
    print(node.nodeValue);
    InOrderDisplay(node.right);
  }
}

void main() {
  BinarySearchTree<int> bst = BinarySearchTree<int>();
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);

  STNode<int>? rootNode = bst.getRoot();
  if (rootNode != null) {
    print('Root Value: ${rootNode.nodeValue}');
  } else {
    print('The tree is empty.');
  }

  print('InOrder Display:');
  bst.InOrderDisplay(bst.getRoot());

  STNode<int>? nodeToRemove = bst.findNode(20);
  bst.RemoveNode(nodeToRemove);

  print('InOrder Display after removal:');
  bst.InOrderDisplay(bst.getRoot());
}


