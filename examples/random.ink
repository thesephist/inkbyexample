intro := 'We can access randomness through two builtins — <code>rand</code> and <code>urand</code>. On Linux they typically map to <code>/dev/random</code> and <code>/dev/urandom</code>.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
range := std.range
each := std.each
log := std.log


'
    },
    {
        docs: 'For a random number in the range [0, 1) — including zero but excluding one — we use <code>rand</code>.'
        code: 'choices := [rand(), rand(), rand()]
log(choices)

'
    },
    {
        docs: 'We can use this to shuffle a list using the Fisher-Yates algorithm.'
        code: '
` an ordered list `
numbers := range(0, 10, 1)

shuffle := list => (
    each(list, (val, i) => (
        pick := floor(rand() * (len(list) - i - 1))
        current := len(list) - 1 - i
        tmp := list.(current)
        list.(current) := list.(pick)
        list.(pick) := tmp
    ))
    list
)
log(shuffle(numbers))

'
    },
    {
        docs: 'For cryptographically secure randomness, use <code>urand</code>. This uses the most secure random number generation interface your system provides to generate a string of random data.'
        code: '
length := 10
log(urand(10))

'
    }
]

end := ''
