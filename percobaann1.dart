class Tnode<T> {
  T key;
  Tnode<T>? left;
  Tnode<T>? right;

  Tnode(this.key);
}

class BinaryTree<T> {
  Tnode<T>? root;

  BinaryTree() {
    root = null;
  }
}

void main() {
  BinaryTree<int> t = BinaryTree();
  t.root = Tnode(10);
  t.root!.left = Tnode(20);
  t.root!.right = Tnode(30);
  t.root!.right!.left = Tnode(4);
}
