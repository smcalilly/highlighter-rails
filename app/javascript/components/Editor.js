// Import React dependencies.
import React, { useEffect, useMemo, useState, useCallback } from "react";
// Import the Slate editor factory.
import { createEditor } from 'slate'
import marked from 'marked'

// Import the Slate components and React plugin.
import { Slate, Editable, withReact } from 'slate-react'

const Editor = () => {
  const editor = useMemo(() => withReact(createEditor()), [])
  const [value, setValue] = useState([
    {
      type: 'paragraph',
      children: [{ text: 'A line of text in a paragraph.' }],
    },
  ])

  const renderElement = useCallback(({ children }) => {
    console.log('render')
    console.log(children)
    children.props.node.children.forEach(({ text }) => {
      console.log('text')
      console.log(text)
      return marked(text)
    })
  })
  
  return (
    <Slate editor={editor} value={value} onChange={newValue => setValue(newValue)}>
      <Editable renderElement={renderElement} />
    </Slate>
  )
}

export default Editor