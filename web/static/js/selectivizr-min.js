/*
 * selectivizr v1.0.2 - (c) Keith Clark, freely distributable under the terms of the MIT license.
 * selectivizr.com
 */
(function (j) {
    function A(a) {
        return a.replace(B, h).replace(C, function (a, d, b) {
            for (var a = b.split(","), b = 0, e = a.length; b < e; b++) {
                var s = D(a[b].replace(E, h).replace(F, h)) + o, l = [];
                a[b] = s.replace(G, function (a, b, c, d, e) {
                    if (b) {
                        if (l.length > 0) {
                            var a = l, f, e = s.substring(0, e).replace(H, i);
                            if (e == i || e.charAt(e.length - 1) == o) {
                                e += "*"
                            }
                            try {
                                f = t(e)
                            } catch (k) {
                            }
                            if (f) {
                                e = 0;
                                for (c = f.length; e < c; e++) {
                                    for (var d = f[e], h = d.className, j = 0, m = a.length; j < m; j++) {
                                        var g = a[j];
                                        if (!RegExp("(^|\\s)" + g.className + "(\\s|$)").test(d.className) && g.b && (g.b === !0 || g.b(d) === !0)) {
                                            h = u(h, g.className, !0)
                                        }
                                    }
                                    d.className = h
                                }
                            }
                            l = []
                        }
                        return b
                    } else {
                        if (b = c ? I(c) : !v || v.test(d) ? {className: w(d), b: !0} : null) {
                            return l.push(b), "." + b.className
                        }
                        return a
                    }
                })
            }
            return d + a.join(",")
        })
    }

    function I(a) {
        var c = !0, d = w(a.slice(1)), b = a.substring(0, 5) == ":not(", e, f;
        b && (a = a.slice(5, -1));
        var l = a.indexOf("(");
        l > -1 && (a = a.substring(0, l));
        if (a.charAt(0) == ":") {
            switch (a.slice(1)) {
                case"root":
                    c = function (a) {
                        return b ? a != p : a == p
                    };
                    break;
                case"target":
                    if (m == 8) {
                        c = function (a) {
                            function c() {
                                var d = location.hash, e = d.slice(1);
                                return b ? d == i || a.id != e : d != i && a.id == e
                            }

                            k(j, "hashchange", function () {
                                g(a, d, c())
                            });
                            return c()
                        };
                        break
                    }
                    return !1;
                case"checked":
                    c = function (a) {
                        J.test(a.type) && k(a, "propertychange", function () {
                            event.propertyName == "checked" && g(a, d, a.checked !== b)
                        });
                        return a.checked !== b
                    };
                    break;
                case"disabled":
                    b = !b;
                case"enabled":
                    c = function (c) {
                        if (K.test(c.tagName)) {
                            return k(c, "propertychange", function () {
                                event.propertyName == "$disabled" && g(c, d, c.a === b)
                            }), q.push(c), c.a = c.disabled, c.disabled === b
                        }
                        return a == ":enabled" ? b : !b
                    };
                    break;
                case"focus":
                    e = "focus", f = "blur";
                case"hover":
                    e || (e = "mouseenter", f = "mouseleave");
                    c = function (a) {
                        k(a, b ? f : e, function () {
                            g(a, d, !0)
                        });
                        k(a, b ? e : f, function () {
                            g(a, d, !1)
                        });
                        return b
                    };
                    break;
                default:
                    if (!L.test(a)) {
                        return !1
                    }
            }
        }
        return {className: d, b: c}
    }

    function w(a) {
        return M + "-" + (m == 6 && N ? O++ : a.replace(P, function (a) {
            return a.charCodeAt(0)
        }))
    }

    function D(a) {
        return a.replace(x, h).replace(Q, o)
    }

    function g(a, c, d) {
        var b = a.className, c = u(b, c, d);
        if (c != b) {
            a.className = c, a.parentNode.className += i
        }
    }

    function u(a, c, d) {
        var b = RegExp("(^|\\s)" + c + "(\\s|$)"), e = b.test(a);
        return d ? e ? a : a + o + c : e ? a.replace(b, h).replace(x, h) : a
    }

    function k(a, c, d) {
        a.attachEvent("on" + c, d)
    }

    function r(a, c) {
        if (/^https?:\/\//i.test(a)) {
            return c.substring(0, c.indexOf("/", 8)) == a.substring(0, a.indexOf("/", 8)) ? a : null
        }
        if (a.charAt(0) == "/") {
            return c.substring(0, c.indexOf("/", 8)) + a
        }
        var d = c.split(/[?#]/)[0];
        a.charAt(0) != "?" && d.charAt(d.length - 1) != "/" && (d = d.substring(0, d.lastIndexOf("/") + 1));
        return d + a
    }

    function y(a) {
        if (a) {
            return n.open("GET", a, !1), n.send(), (n.status == 200 ? n.responseText : i).replace(R, i).replace(S, function (c, d, b, e, f) {
                return y(r(b || f, a))
            }).replace(T, function (c, d, b) {
                d = d || i;
                return " url(" + d + r(b, a) + d + ") "
            })
        }
        return i
    }

    function U() {
        var a, c;
        a = f.getElementsByTagName("BASE");
        for (var d = a.length > 0 ? a[0].href : f.location.href, b = 0; b < f.styleSheets.length; b++) {
            if (c = f.styleSheets[b], c.href != i && (a = r(c.href, d))) {
                c.cssText = A(y(a))
            }
        }
        q.length > 0 && setInterval(function () {
            for (var a = 0, c = q.length; a < c; a++) {
                var b = q[a];
                if (b.disabled !== b.a) {
                    b.disabled ? (b.disabled = !1, b.a = !0, b.disabled = !0) : b.a = b.disabled
                }
            }
        }, 250)
    }

    if (!
        /*@cc_on!@*/
        true) {
        var f = document, p = f.documentElement, n = function () {
            if (j.XMLHttpRequest) {
                return new XMLHttpRequest
            }
            try {
                return new ActiveXObject("Microsoft.XMLHTTP")
            } catch (a) {
                return null
            }
        }(), m = /MSIE (\d+)/.exec(navigator.userAgent)[1];
        if (!(f.compatMode != "CSS1Compat" || m < 6 || m > 8 || !n)) {
            var z = {
                    NW: "*.Dom.select",
                    MooTools: "$$",
                    DOMAssistant: "*.$",
                    Prototype: "$$",
                    YAHOO: "*.util.Selector.query",
                    Sizzle: "*",
                    jQuery: "*",
                    dojo: "*.query"
                }, t, q = [], O = 0, N = !0, M = "slvzr", R = /(\/\*[^*]*\*+([^\/][^*]*\*+)*\/)\s*/g,
                S = /@import\s*(?:(?:(?:url\(\s*(['"]?)(.*)\1)\s*\))|(?:(['"])(.*)\3))[^;]*;/g,
                T = /\burl\(\s*(["']?)(?!data:)([^"')]+)\1\s*\)/g,
                L = /^:(empty|(first|last|only|nth(-last)?)-(child|of-type))$/, B = /:(:first-(?:line|letter))/g,
                C = /(^|})\s*([^\{]*?[\[:][^{]+)/g, G = /([ +~>])|(:[a-z-]+(?:\(.*?\)+)?)|(\[.*?\])/g,
                H = /(:not\()?:(hover|enabled|disabled|focus|checked|target|active|visited|first-line|first-letter)\)?/g,
                P = /[^\w-]/g, K = /^(INPUT|SELECT|TEXTAREA|BUTTON)$/, J = /^(checkbox|radio)$/,
                v = m > 6 ? /[\$\^*]=(['"])\1/ : null, E = /([(\[+~])\s+/g, F = /\s+([)\]+~])/g, Q = /\s+/g,
                x = /^\s*((?:[\S\s]*\S)?)\s*$/, i = "", o = " ", h = "$1";
            (function (a, c) {
                function d() {
                    try {
                        p.doScroll("left")
                    } catch (a) {
                        setTimeout(d, 50);
                        return
                    }
                    b("poll")
                }

                function b(d) {
                    if (!(d.type == "readystatechange" && f.readyState != "complete") && ((d.type == "load" ? a : f).detachEvent("on" + d.type, b, !1), !e && (e = !0))) {
                        c.call(a, d.type || d)
                    }
                }

                var e = !1, g = !0;
                if (f.readyState == "complete") {
                    c.call(a, i)
                } else {
                    if (f.createEventObject && p.doScroll) {
                        try {
                            g = !a.frameElement
                        } catch (h) {
                        }
                        g && d()
                    }
                    k(f, "readystatechange", b);
                    k(a, "load", b)
                }
            })(j, function () {
                for (var a in z) {
                    var c, d, b = j;
                    if (j[a]) {
                        for (c = z[a].replace("*", a).split("."); (d = c.shift()) && (b = b[d]);) {
                        }
                        if (typeof b == "function") {
                            t = b;
                            U();
                            break
                        }
                    }
                }
            })
        }
    }
})(this);