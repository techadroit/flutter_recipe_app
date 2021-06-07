

abstract class Either<L, R>  {
  const Either();

  B fold<B>(B ifLeft(L l), B ifRight(R r));

  Either<L, R> orElse(Either<L, R> other()) => fold((_) => other(), (_) => this);
  R getOrElse(R dflt()) => fold((_) => dflt(), id);
  R operator |(R dflt) => getOrElse(() => dflt);
  Either<L2, R> leftMap<L2>(L2 f(L l)) => fold((L l) => left(f(l)), right);
  bool isLeft() => fold((_) => true, (_) => false);
  bool isRight() => fold((_) => false, (_) => true);
  Either<R, L> swap() => fold(right, left);

  @override Either<L, R2> map<R2>(R2 f(R r)) => fold(left, (R r) => right(f(r)));
  @override Either<L, R2> bind<R2>(Function1<R, Either<L, R2>> f) => fold(left, f);
  @override Either<L, R2> flatMap<R2>(Function1<R, Either<L, R2>> f) => fold(left, f);
  @override Either<L, R2> andThen<R2>(Either<L, R2> next) => fold(left, (_) => next);

  Either<L, R> filter(bool predicate(R r), L fallback()) => fold((_) => this, (r) => predicate(r) ? this : left(fallback()));
  Either<L, R> where(bool predicate(R r), L fallback()) => filter(predicate, fallback);

  static Either<L, C> map2<L, A, A2 extends A, B, B2 extends B, C>(Either<L, A2> fa, Either<L, B2> fb, C fun(A a, B b)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => right(fun(a, b))));

  static Either<L, D> map3<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, D fun(A a, B b, C c)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => right(fun(a, b, c)))));

  static Either<L, E> map4<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, E fun(A a, B b, C c, D d)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => right(fun(a, b, c, d))))));

  static Either<L, F> map5<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, F fun(A a, B b, C c, D d, E e)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => right(fun(a, b, c, d, e)))))));

  static Either<L, G> map6<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, G fun(A a, B b, C c, D d, E e, F f)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => right(fun(a, b, c, d, e, f))))))));

  static Either<L, H> map7<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, H fun(A a, B b, C c, D d, E e, F f, G g)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => right(fun(a, b, c, d, e, f, g)))))))));

  static Either<L, I> map8<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, I fun(A a, B b, C c, D d, E e, F f, G g, H h)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => right(fun(a, b, c, d, e, f, g, h))))))))));

  static Either<L, J> map9<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, J fun(A a, B b, C c, D d, E e, F f, G g, H h, I i)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => right(fun(a, b, c, d, e, f, g, h, i)))))))))));

  static Either<L, K> map10<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, K fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => right(fun(a, b, c, d, e, f, g, h, i, j))))))))))));

  static Either<L, LL> map11<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, LL fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => right(fun(a, b, c, d, e, f, g, h, i, j, k)))))))))))));

  static Either<L, M> map12<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, M fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l))))))))))))));

  static Either<L, N> map13<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, N fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m)))))))))))))));

  static Either<L, O> map14<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, O fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n))))))))))))))));

  static Either<L, P> map15<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, P fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)))))))))))))))));

  static Either<L, Q> map16<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P, P2 extends P, Q>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Q fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => fp.fold(left, (p) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p))))))))))))))))));

  static Either<L, R> map17<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P, P2 extends P, Q, Q2 extends Q, R>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, R fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => fp.fold(left, (p) => fq.fold(left, (q) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q)))))))))))))))))));

  static Either<L, S> map18<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P, P2 extends P, Q, Q2 extends Q, R, R2 extends R, S>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr, S fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => fp.fold(left, (p) => fq.fold(left, (q) => fr.fold(left, (r) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r))))))))))))))))))));

  static Either<L, T> map19<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P, P2 extends P, Q, Q2 extends Q, R, R2 extends R, S, S2 extends S, T>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr, Either<L, S> fs, T fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r, S s)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => fp.fold(left, (p) => fq.fold(left, (q) => fr.fold(left, (r) => fs.fold(left, (s) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s)))))))))))))))))))));

  static Either<L, U> map20<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G, G2 extends G, H, H2 extends H, I, I2 extends I, J, J2 extends J, K, K2 extends K, LL, LL2 extends LL, M, M2 extends M, N, N2 extends N, O, O2 extends O, P, P2 extends P, Q, Q2 extends Q, R, R2 extends R, S, S2 extends S, T, T2 extends T, U>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C2> fc, Either<L, D2> fd, Either<L, E2> fe, Either<L, F2> ff, Either<L, G2> fg, Either<L, H2> fh, Either<L, I2> fi, Either<L, J2> fj, Either<L, K2> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr, Either<L, S> fs, Either<L, T> ft, U fun(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r, S s, T t)) =>
      fa.fold(left, (a) => fb.fold(left, (b) => fc.fold(left, (c) => fd.fold(left, (d) => fe.fold(left, (e) => ff.fold(left, (f) => fg.fold(left, (g) => fh.fold(left, (h) => fi.fold(left, (i) => fj.fold(left, (j) => fk.fold(left, (k) => fl.fold(left, (l) => fm.fold(left, (m) => fn.fold(left, (n) => fo.fold(left, (o) => fp.fold(left, (p) => fq.fold(left, (q) => fr.fold(left, (r) => fs.fold(left, (s) => ft.fold(left, (t) => right(fun(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t))))))))))))))))))))));

  static Either<L, C> mapM2<L, A, A2 extends A, B, B2 extends B, C>(Either<L, A2> fa, Either<L, B2> fb, Either<L, C> f(A a, B b)) => fa.bind((a) => fb.bind((b) => f(a, b)));

  static Function1<Either<L, A>, Either<L, B>> lift<L, A, B>(B f(A a)) => ((Either<L, A> oa) => oa.map(f));
  static Function2<Either<L, A>, Either<L, B>, Either<L, C>> lift2<L, A, B, C>(C f(A a, B b)) => (Either<L, A> fa, Either<L, B> fb) => map2(fa, fb, f);
  static Function3<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>> lift3<L, A, B, C, D>(D f(A a, B b, C c)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc) => map3(fa, fb, fc, f);
  static Function4<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>> lift4<L, A, B, C, D, E>(E f(A a, B b, C c, D d)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd) => map4(fa, fb, fc, fd, f);
  static Function5<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>> lift5<L, A, B, C, D, E, F>(F f(A a, B b, C c, D d, E e)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe) => map5(fa, fb, fc, fd, fe, f);
  static Function6<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>> lift6<L, A, B, C, D, E, F, G>(G f(A a, B b, C c, D d, E e, F f)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff) => map6(fa, fb, fc, fd, fe, ff, f);
  static Function7<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>> lift7<L, A, B, C, D, E, F, G, H>(H f(A a, B b, C c, D d, E e, F f, G g)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg) => map7(fa, fb, fc, fd, fe, ff, fg, f);
  static Function8<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>> lift8<L, A, B, C, D, E, F, G, H, I>(I f(A a, B b, C c, D d, E e, F f, G g, H h)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh) => map8(fa, fb, fc, fd, fe, ff, fg, fh, f);
  static Function9<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>> lift9<L, A, B, C, D, E, F, G, H, I, J>(J f(A a, B b, C c, D d, E e, F f, G g, H h, I i)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi) => map9(fa, fb, fc, fd, fe, ff, fg, fh, fi, f);
  static Function10<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>> lift10<L, A, B, C, D, E, F, G, H, I, J, K>(K f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj) => map10(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, f);
  static Function11<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>> lift11<L, A, B, C, D, E, F, G, H, I, J, K, LL>(LL f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk) => map11(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, f);
  static Function12<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>> lift12<L, A, B, C, D, E, F, G, H, I, J, K, LL, M>(M f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl) => map12(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, f);
  static Function13<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>> lift13<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N>(N f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm) => map13(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, f);
  static Function14<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>> lift14<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O>(O f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn) => map14(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, f);
  static Function15<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>> lift15<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P>(P f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo) => map15(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, f);
  static Function16<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>, Either<L, Q>> lift16<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P, Q>(Q f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp) => map16(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, fp, f);
  static Function17<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>, Either<L, Q>, Either<L, R>> lift17<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P, Q, R>(R f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq) => map17(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, fp, fq, f);
  static Function18<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>, Either<L, Q>, Either<L, R>, Either<L, S>> lift18<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P, Q, R, S>(S f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr) => map18(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, fp, fq, fr, f);
  static Function19<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>, Either<L, Q>, Either<L, R>, Either<L, S>, Either<L, T>> lift19<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P, Q, R, S, T>(T f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r, S s)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr, Either<L, S> fs) => map19(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, fp, fq, fr, fs, f);
  static Function20<Either<L, A>, Either<L, B>, Either<L, C>, Either<L, D>, Either<L, E>, Either<L, F>, Either<L, G>, Either<L, H>, Either<L, I>, Either<L, J>, Either<L, K>, Either<L, LL>, Either<L, M>, Either<L, N>, Either<L, O>, Either<L, P>, Either<L, Q>, Either<L, R>, Either<L, S>, Either<L, T>, Either<L, U>> lift20<L, A, B, C, D, E, F, G, H, I, J, K, LL, M, N, O, P, Q, R, S, T, U>(U f(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, LL l, M m, N n, O o, P p, Q q, R r, S s, T t)) => (Either<L, A> fa, Either<L, B> fb, Either<L, C> fc, Either<L, D> fd, Either<L, E> fe, Either<L, F> ff, Either<L, G> fg, Either<L, H> fh, Either<L, I> fi, Either<L, J> fj, Either<L, K> fk, Either<L, LL> fl, Either<L, M> fm, Either<L, N> fn, Either<L, O> fo, Either<L, P> fp, Either<L, Q> fq, Either<L, R> fr, Either<L, S> fs, Either<L, T> ft) => map20(fa, fb, fc, fd, fe, ff, fg, fh, fi, fj, fk, fl, fm, fn, fo, fp, fq, fr, fs, ft, f);

  @override String toString() => fold((l) => 'Left($l)', (r) => 'Right($r)');


  void forEach(void sideEffect(R r)) => fold((_) => null, sideEffect);
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;
  @override B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifLeft(_l);
  @override bool operator ==(other) => other is Left && other._l == _l;
  @override int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
  @override B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifRight(_r);
  @override bool operator ==(other) => other is Right && other._r == _r;
  @override int get hashCode => _r.hashCode;
}


Either<L, R> left<L, R>(L l) => new Left(l);
Either<L, R> right<L, R>(R r) => new Right(r);
Either<dynamic, A> catching<A>(Function0<A> thunk) {
  try {
    return right(thunk());
  } catch(e) {
    return left(e);
  }
}

A id<A>(A a) => a;

typedef A Function0 <A>                                                            ();
typedef B Function1 <A, B>                                                         (A a);
typedef C Function2 <A, B, C>                                                      (A a, B b);
typedef D Function3 <A, B, C, D>                                                   (A a, B b, C c);
typedef E Function4 <A, B, C, D, E>                                                (A a, B b, C c, D d);
typedef F Function5 <A, B, C, D, E, F>                                             (A a, B b, C c, D d, E e);
typedef G Function6 <A, B, C, D, E, F, G>                                          (A a, B b, C c, D d, E e, F f);
typedef H Function7 <A, B, C, D, E, F, G, H>                                       (A a, B b, C c, D d, E e, F f, G g);
typedef I Function8 <A, B, C, D, E, F, G, H, I>                                    (A a, B b, C c, D d, E e, F f, G g, H h);
typedef J Function9 <A, B, C, D, E, F, G, H, I, J>                                 (A a, B b, C c, D d, E e, F f, G g, H h, I i);
typedef K Function10<A, B, C, D, E, F, G, H, I, J, K>                              (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j);
typedef L Function11<A, B, C, D, E, F, G, H, I, J, K, L>                           (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k);
typedef M Function12<A, B, C, D, E, F, G, H, I, J, K, L, M>                        (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l);
typedef N Function13<A, B, C, D, E, F, G, H, I, J, K, L, M, N>                     (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m);
typedef O Function14<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>                  (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n);
typedef P Function15<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>               (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o);
typedef Q Function16<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>            (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p);
typedef R Function17<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>         (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q);
typedef S Function18<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>      (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r);
typedef T Function19<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>   (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r, S s);
typedef U Function20<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U>(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r, S s, T t);
